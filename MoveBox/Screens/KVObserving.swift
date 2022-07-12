//
//  KVObserving.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 07.07.2022.
//

import UIKit

class Person: NSObject {
    @objc dynamic var name = String()
}

class KVObserving: UIViewController {
    
    let swiftImageView = CustomImageView(image: .swift)
    private let topStack = CustomStackView(frame: .zero)
    private let bottomStack = CustomStackView(frame: .zero)
    let swiftView = UIView()
    var textField = CustomTextField(placeholder: CustomText.placeholder)
    var textLabel = CustomLabel(text: CustomText.text)
    var nameLabel = CustomLabel(text: CustomText.name)
    let actionButton = ActionButton(text: CustomText.action)
    let secretButton = ActionButton(text: "PUSH")
    
    @objc let objectToObserve = Person()
    var observation: NSKeyValueObservation?
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        return tap
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
        observerHandling()
        setActions()
        secretButton.isHidden = true
    }
    
    private func observerHandling() {
         observation = observe(\.objectToObserve.name, options: [.old, .new]) { _ , change in
            guard let newName = change.newValue, let oldName = change.oldValue else { return }
            print("name changed from: \(oldName), updated to: \(newName)")
            self.nameLabel.text = newName
        }
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setTopStackView(superview: view, stackView: topStack, textField: textField, label: nameLabel)
        view.setBottomStackView(superview: view, stackView: bottomStack, button: actionButton, label: textLabel, topStackView: topStack)
        view.setSwiftView(superview: view, view: swiftView, stackView: topStack)
        view.setSwiftImageView(superview: swiftView, imageView: swiftImageView)
        view.setSecretButton(superview: swiftView, button: secretButton, imageView: swiftImageView)
    }
    
    func setActions() {
        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        self.textField.addTarget(self, action: #selector(textFieldEditing(_:)), for: .editingChanged)
        swiftImageView.addGestureRecognizer(tapGestureRecognizer)
        secretButton.addTarget(self, action: #selector(secretButtonPressed), for: .touchUpInside)
    }

    @objc func actionButtonPressed() {
        objectToObserve.name = "John Connor"
    }
    
    @objc func textFieldEditing(_ textField: UITextField) {
        textLabel.text = textField.text
    }
    
    @objc func secretButtonPressed() {
        let vc = CombineVC()
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated: true)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        guard let piece = recognizer.view else { return }
        if recognizer.state == .ended {
            let animator = UIViewPropertyAnimator(duration: 0.8, curve: .easeInOut) {
                piece.center.y -= 80
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(800)) {
                    self.secretButton.isHidden = false
                }
            }
            animator.startAnimation()
            
        }
    }
    
 
}


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
    
    let swiftImageView = GenericImageView(image: .swift)
    let topStack = CustomStackView(frame: .zero)
    let bottomStack = CustomStackView(frame: .zero)
    let swiftView = UIView()
    var textField = CustomTextField(placeholder: CustomText.placeholder)
    var textLabel = CustomLabel(text: CustomText.text)
    var nameLabel = CustomLabel(text: CustomText.name)
    let actionButton = ActionButton(text: CustomText.action)
    
    @objc let objectToObserve = Person()
    var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        observerHandling()
        setActions()
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
        
    }
    
    func setActions() {
        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        self.textField.addTarget(self, action: #selector(textFieldEditing(_:)), for: .editingChanged)
    }
    
    @objc func actionButtonPressed() {
        objectToObserve.name = "John Connor"
    }
    
    @objc func textFieldEditing(_ textField: UITextField) {
        textLabel.text = textField.text
    }
    
 
}


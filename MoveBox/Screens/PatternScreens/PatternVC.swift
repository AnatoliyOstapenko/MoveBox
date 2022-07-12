//
//  DelegatePatternVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 11.07.2022.
//

import UIKit

class PatternVC: UIViewController {
    
    private let stackView = CustomStackView(frame: .zero)
    private let delegateButton = ActionButton(text: CustomText.delegatePattern)
    private let observerButton = ActionButton(text: CustomText.observerPattern)
    private var patternLabel = CustomLabel(text: CustomText.pattern)
    private var questionImageView = CustomImageView(image: .question)
    
    private let up = Notification.Name(upNotificationKey)
    private let down = Notification.Name(downNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        actions()
        createObservers()
    }
    
    func createObservers() {
        // Observe the up label chosen
        NotificationCenter.default.addObserver(self, selector: #selector(updatePatternLabel(_:)), name: up, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateQuestionImageView(_:)), name: up, object: nil)
        
        // Observe the down label chosen
        NotificationCenter.default.addObserver(self, selector: #selector(updatePatternLabel(_:)), name: down, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateQuestionImageView(_:)), name: down, object: nil)
    }
    
    @objc func updatePatternLabel(_ notification: NSNotification) {
        let isUp = notification.name == up
        let textLabel = isUp ? CustomText.up : CustomText.down
        patternLabel.text = textLabel
    }
    
    @objc func updateQuestionImageView(_ notification: NSNotification) {
        let isUp = notification.name == up
        let image = isUp ? SFSymbols.up : SFSymbols.down
        questionImageView.image = image
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setPatternStackView(superview: view, label: patternLabel, stack: stackView, topButton: delegateButton, bottomButton: observerButton)
        view.setQuestionImage(superview: view, imageView: questionImageView, stackView: stackView)
    }
    
    private func actions() {
        delegateButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        observerButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == CustomText.delegatePattern {
            let vc = DelegatePatternVC()
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = ObserverPatternVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension PatternVC: DelegatePatternProtocol {
    func updateUI(imageView: CustomImageView, textLabel: String) {
        questionImageView.image = imageView.image
        patternLabel.text = textLabel
    }
    
    
    
}


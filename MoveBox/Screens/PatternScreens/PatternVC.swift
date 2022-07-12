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
    var patternLabel = CustomLabel(text: "Choose the pattern")
    private var questionImageView = CustomImageView(image: .question)

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        actions()
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
            print("TBD")
        }
    }
}

extension PatternVC: DelegatePatternProtocol {
    func updateUI(imageView: CustomImageView, textLabel: String) {
        questionImageView.image = imageView.image
        patternLabel.text = textLabel
    }
    
    
    
}


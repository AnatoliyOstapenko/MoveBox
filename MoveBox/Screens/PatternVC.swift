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

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setPatternStackView(superview: view, stack: stackView, topButton: delegateButton, bottomButton: observerButton)
    }


}

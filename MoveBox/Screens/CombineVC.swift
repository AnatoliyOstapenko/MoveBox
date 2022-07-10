//
//  CombineVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 10.07.2022.
//

import UIKit

class CombineVC: UIViewController {
    
    var blogTextField = CustomTextField(placeholder: "New Blog Post")
    let publishButton = ActionButton(text: "Publish")
    let subscribeLabel = CustomLabel(text: "Subscriber")
    private let topStackView = CustomStackView(frame: .zero)
    private let bottomStackView = CustomStackView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setTopStackView(superview: view, stackView: topStackView, textField: blogTextField, label: subscribeLabel)
        view.setBottomStackView(superview: view, stackView: bottomStackView, button: publishButton, label: subscribeLabel, topStackView: topStackView)
    }

}

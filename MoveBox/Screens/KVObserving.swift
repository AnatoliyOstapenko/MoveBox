//
//  KVObserving.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 07.07.2022.
//

import UIKit

class KVObserving: UIViewController {
    
    let swiftImageView = GenericImageView(image: .swift)
    let topStack = CustomStackView(frame: .zero)
    let bottomStack = CustomStackView(frame: .zero)
    let swiftView = UIView()
    let textField = CustomTextField(placeholder: CustomText.placeholder)
    let textLabel = CustomLabel(text: CustomText.text)
    let nameLabel = CustomLabel(text: CustomText.name)
    let actionButton = ActionButton(text: CustomText.action, backgroundColor: .systemPink)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setTopStackView(superview: view, stackView: topStack, textField: textField, label: nameLabel)
        view.setBottomStackView(superview: view, stackView: bottomStack, button: actionButton, label: textLabel, topStackView: topStack)
        view.setSwiftView(superview: view, view: swiftView, stackView: topStack)
        view.setSwiftImageView(superview: swiftView, imageView: swiftImageView)

    }
 
}

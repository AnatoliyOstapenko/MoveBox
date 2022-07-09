//
//  CustomTextField.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 09.07.2022.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemPink.cgColor
        layer.borderWidth = 2
        font = .preferredFont(forTextStyle: .caption2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 7
        translatesAutoresizingMaskIntoConstraints = false
    }
}

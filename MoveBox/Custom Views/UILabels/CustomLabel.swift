//
//  CustomLabel.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 09.07.2022.
//

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    private func configure() {
        textColor = .label
        textAlignment = .center
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemPink.cgColor
        layer.borderWidth = 2
        font = .preferredFont(forTextStyle: .headline)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 7
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

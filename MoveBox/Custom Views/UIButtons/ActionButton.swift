//
//  ActionButton.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 08.07.2022.
//

import UIKit

class ActionButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.setTitle(text, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}

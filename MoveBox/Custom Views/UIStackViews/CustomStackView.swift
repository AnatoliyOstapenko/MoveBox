//
//  CustomStackView.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 08.07.2022.
//

import UIKit

class CustomStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        axis = .horizontal
        distribution = .fillEqually
        spacing = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}

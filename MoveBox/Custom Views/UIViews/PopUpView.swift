//
//  PopUpView.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

class PopUpView: UIView {
    
    let popUpImage = PopUpImageView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

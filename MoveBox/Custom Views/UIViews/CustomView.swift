//
//  PopUpView.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

class CustomView: UIView {
    
    var popUpImage = GenericImageView(image: .keyImage)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .secondarySystemBackground
        setPopUpImage(view: self, image: popUpImage)
    }
    
}

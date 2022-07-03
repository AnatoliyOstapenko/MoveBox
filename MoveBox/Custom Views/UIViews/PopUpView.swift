//
//  PopUpView.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

class PopUpView: UIView {
    
    let popUpImage = GenericImageView(image: .popUpImage)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemPink
        setPopUpImage(view: self, image: popUpImage)
    }
    
}

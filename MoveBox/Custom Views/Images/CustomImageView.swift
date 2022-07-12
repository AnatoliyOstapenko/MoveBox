//
//  BoxImageView.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

enum Image { case boxImage, keyImage, combineImage, lockImage, unlock, swift, up, down, question }

class CustomImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: Image) {
        self.init(frame: .zero)
        set(image: image)
    }
    
    private func configure() {
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(image: Image) {
        switch image {
        case .boxImage:
            self.image = SFSymbols.boxImage
        case .keyImage:
            self.image = SFSymbols.keyImage
        case .combineImage:
            self.image = SFSymbols.combineImage
        case .lockImage:
            self.image = SFSymbols.lockImage
        case .unlock:
            self.image = SFSymbols.unlockImage
        case .swift:
            self.image = SFSymbols.swift
        case .up:
            self.image = SFSymbols.up
        case .down:
            self.image = SFSymbols.down
        case .question:
            self.image = SFSymbols.question
        }
    }
    

}

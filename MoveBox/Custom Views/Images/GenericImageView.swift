//
//  BoxImageView.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

enum Image { case boxImage, popUpImage, combine }

class GenericImageView: UIImageView {

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
        case .popUpImage:
            self.image = SFSymbols.ejectImage
        case .combine:
            self.image = SFSymbols.combineImage
        }
    }
    

}

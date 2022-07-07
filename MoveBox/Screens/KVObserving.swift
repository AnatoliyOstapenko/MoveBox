//
//  KVObserving.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 07.07.2022.
//

import UIKit

class KVObserving: UIViewController {
    
    let swiftImageView = UIImageView()
    let containerView = UIView()
    let textField = UITextField()
    let textLabel = UILabel()
    let nameLabel = UILabel()
    let actionButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    private func configure() {
        
        // swiftImageView
        view.addSubview(swiftImageView)
        NSLayoutConstraint.activate([
            swiftImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            
        ])
    }
 
}

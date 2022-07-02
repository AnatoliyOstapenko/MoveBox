//
//  UIView+Ext.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

private let size: CGFloat = 100

extension UIView {
    
    func moveBoxSet(superview: UIView, view: UIImageView) {
        superview.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: size),
            view.widthAnchor.constraint(equalToConstant: size)
        ])
    }
}

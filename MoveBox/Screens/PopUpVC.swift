//
//  PopUpVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

enum State { case open, closed }

class PopUpVC: UIViewController {
    
    let popUpView = PopUpView(frame: .zero)
    let lockImageView = GenericImageView(image: .lockImage)
    
    private lazy var tapRecognizer: UIPanGestureRecognizer = {
        let tap = UIPanGestureRecognizer(target: self, action: #selector(popUpViewTapped(recognizer:)))
        return tap
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .secondarySystemBackground
        view.setPopUpView(superView: view, popUpView: popUpView, recognizer: tapRecognizer)
        view.setLockImageView(superview: view, imageView: lockImageView)
    }
    
    @objc private func popUpViewTapped(recognizer: UIPanGestureRecognizer) {
        guard let piece = recognizer.view else { return }
        
        
        
    }
    
}

extension State {
    var opposite: State {
        switch self {
        case .open: return .closed
        case .closed: return .open
        }
    }
}

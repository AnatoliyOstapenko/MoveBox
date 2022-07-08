//
//  PopUpVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

class UnlockVC: UIViewController {
    
    var popUpView = PopUpView(frame: .zero)
    var lockImageView = GenericImageView(image: .lockImage)
    var initialCenter = CGPoint()
    
    private lazy var panRecognizer: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(unlockPan(_:)))
        return pan
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }

    private func configure() {
        view.backgroundColor = .secondarySystemBackground
        view.setPopUpView(superView: view, view: popUpView)
        view.setLockImageView(superview: view, imageView: lockImageView)
        view.bringSubviewToFront(popUpView)
        popUpView.addGestureRecognizer(panRecognizer)
    }
    
    @objc private func unlockPan(_ recognizer: UIPanGestureRecognizer) {
        guard let piece = recognizer.view else { return }
        let translation = recognizer.translation(in: piece.superview)
        
        switch recognizer.state {
        case .began:
            initialCenter = piece.center
        case .changed:
            piece.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
        case .ended:
            piece.center = initialCenter
        default:
            break
        }
        
    }
    
}


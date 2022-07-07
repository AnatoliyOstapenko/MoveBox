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
    var cutomOrigin = CGPoint()
    
    private lazy var panRecognizer: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(unlockPan(recognizer:)))
        return pan
    }()
    
    override func viewDidLoad() {
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configure()

    }

    private func configure() {
        cutomOrigin = popUpView.frame.origin
        view.backgroundColor = .secondarySystemBackground
        view.setPopUpView(superView: view, view: popUpView, origin: cutomOrigin)
        view.setLockImageView(superview: view, imageView: lockImageView)
        view.bringSubviewToFront(popUpView)
        popUpView.addGestureRecognizer(panRecognizer)
    }
    
    @objc private func unlockPan(recognizer: UIPanGestureRecognizer) {
        guard let piece = recognizer.view else { return }
        let translation = recognizer.translation(in: piece.superview)
        
        switch recognizer.state {
        case .began, .changed:
            piece.center = CGPoint(x: piece.center.x + translation.x, y: piece.center.y + translation.y)
            recognizer.setTranslation(.zero, in: piece)
        case .ended:
            popUpView.frame.origin = cutomOrigin
                
            
        default:
            break
        }
        
        
    }
    
}


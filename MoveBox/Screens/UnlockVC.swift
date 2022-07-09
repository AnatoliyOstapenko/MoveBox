//
//  PopUpVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit


class UnlockVC: UIViewController {
    
    var keyView = CustomView(frame: .zero)
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
        view.setPopUpView(superView: view, view: keyView)
        view.setLockImageView(superview: view, imageView: lockImageView)
        view.bringSubviewToFront(keyView)
        keyView.addGestureRecognizer(panRecognizer)
        lockImageView.image = SFSymbols.lockImage
        
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
            if piece.frame.intersects(lockImageView.frame) {
                unlocking(piece)
            } else {
                originState(piece)
            }
        default:
            break
        }
    }
    
    func unlocking(_ piece: UIView) {
        DispatchQueue.main.async {
            self.lockImageView.image = SFSymbols.unlockImage
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            let vc = KVObserving()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func originState(_ piece: UIView) {
        UIView.animate(withDuration: 0.5) { piece.center = self.initialCenter }
    }
    
}


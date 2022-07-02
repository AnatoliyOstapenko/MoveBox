//
//  ViewController.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

class MoveBoxVC: UIViewController {
    
    var boxView = BoxImageView(frame: .zero)
    var animator = UIViewPropertyAnimator()
    var initialCenter = CGPoint()
    
    lazy var panRecognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        return recognizer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.moveBoxSet(superview: view, view: boxView)
        boxView.addGestureRecognizer(panRecognizer)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        guard let piece = recognizer.view else { return }
        let translation = recognizer.translation(in: piece.superview)
        let velocity = recognizer.velocity(in: piece.superview)
        
        switch recognizer.state {
        case .began:
            print("began translation \(translation) , \(velocity)")
            initialCenter = piece.center
        case .changed:
            print("changed translation \(translation) , \(velocity)")
            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            piece.center = newCenter
        case .ended:
            print("ended translation \(translation) , \(velocity)")
        default:
            break
        }
    }
    
  


}


//
//  ViewController.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

class MoveBoxVC: UIViewController {
    
    var boxView = GenericImageView(image: .boxImage)
    
    private lazy var panRecognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        return recognizer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .secondarySystemBackground
        view.moveBoxSet(superview: view, view: boxView)
        boxView.addGestureRecognizer(panRecognizer)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        guard let piece = recognizer.view else { return }
        let translation = recognizer.translation(in: piece.superview)
        
        switch recognizer.state {
        case .began, .changed:
            piece.center = CGPoint(x: piece.center.x + translation.x, y: piece.center.y + translation.y)
            recognizer.setTranslation(.zero, in: piece)
        case .ended:
            print("ended translation \(translation)")
        default:
            break
        }
    }
    
  


}


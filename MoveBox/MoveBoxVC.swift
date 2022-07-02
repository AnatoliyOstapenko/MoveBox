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
    
    lazy var panRecognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(moveBox(recognizer:)))
        return recognizer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.moveBoxSet(superview: view, view: boxView)
    }
    
    @objc func moveBox(recognizer: UIPanGestureRecognizer) {
        print("Moviiiiing")
    }
    
    


}


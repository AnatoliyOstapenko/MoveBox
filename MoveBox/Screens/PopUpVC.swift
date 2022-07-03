//
//  PopUpVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

enum State { case open, closed }

class PopUpVC: UIViewController {
    
    private var bottomConstraint = NSLayoutConstraint()
    private var currentState: State = .closed
    
    private lazy var popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(popUpViewTapped(recognizer:)))
        return tap
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setPopUpView()
    }
    
    private func configure() {
        view.backgroundColor = .secondarySystemBackground
    }
    
    func setPopUpView() {
        view.addSubview(popUpView)
        popUpView.addGestureRecognizer(tapRecognizer)
        bottomConstraint = popUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 440)
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomConstraint,
            popUpView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    @objc private func popUpViewTapped(recognizer: UITapGestureRecognizer) {
        guard recognizer.view != nil else { return }
                
           if recognizer.state == .ended {
              let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
                  recognizer.view!.center.y -= 300
              })
              animator.startAnimation()
               
           }

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

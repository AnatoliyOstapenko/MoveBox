//
//  AbstractPatternVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 11.07.2022.
//

import UIKit

class AbstractPatternVC: UIViewController {
    
    let patternStackView = CustomStackView(frame: .zero)
    let topImageView = CustomImageView(image: .up)
    let bottomImageView = CustomImageView(image: .down)
    
    lazy var topTapRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(topLabelTapped(_:)))
        return tap
    }()
    
    lazy var downTapRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(bottomLabelTapped(_:)))
        return tap
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setAbstractPatternVC(superview: view, stackView: patternStackView, topImageView: topImageView, bottomImageView: bottomImageView)
        bottomImageView.addGestureRecognizer(downTapRecognizer)
        topImageView.addGestureRecognizer(topTapRecognizer)
    }

    
    @objc func topLabelTapped(_ recognizer: UITapGestureRecognizer) {}
    @objc func bottomLabelTapped(_ recognizer: UITapGestureRecognizer) {}

}

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
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        return tap
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setAbstractPatternVC(superview: view, stackView: patternStackView, topImageView: topImageView, bottomImageView: bottomImageView)
    }

    
    @objc func labelTapped(_ recogniser: UITapGestureRecognizer) {}

}

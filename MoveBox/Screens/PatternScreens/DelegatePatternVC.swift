//
//  DelegatePatternVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 11.07.2022.
//

import UIKit

protocol DelegatePatternProtocol: AnyObject {
    func updateUI(imageView: CustomImageView, textLabel: String)
}

class DelegatePatternVC: AbstractPatternVC {
    
    weak var delegate: DelegatePatternProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemMint
    }
    
    override func topLabelTapped(_ recognizer: UITapGestureRecognizer) {
        delegate?.updateUI(imageView: topImageView, textLabel: CustomText.up)
        rollBack()
    }
    
    override func bottomLabelTapped(_ recognizer: UITapGestureRecognizer) {
        delegate?.updateUI(imageView: bottomImageView, textLabel: CustomText.down)
        rollBack()
    }
    
    func rollBack() { navigationController?.popViewController(animated: true) }
  
}

//
//  ObserverPatternVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 11.07.2022.
//

import UIKit

class ObserverPatternVC: AbstractPatternVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    
    override func topLabelTapped(_ recognizer: UITapGestureRecognizer) {
        print("⬆︎ Observer label chosen")
        rollBack()
    }
    
    override func bottomLabelTapped(_ recognizer: UITapGestureRecognizer) {
        print("⬇︎ Observer label chosen")
        rollBack()
    }
    
    func rollBack() { navigationController?.popViewController(animated: true) }

}

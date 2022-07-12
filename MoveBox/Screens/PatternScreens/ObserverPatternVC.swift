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
        let name = Notification.Name(upNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        rollBack()
    }
    
    override func bottomLabelTapped(_ recognizer: UITapGestureRecognizer) {
        let name = Notification.Name(downNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        rollBack()
    }
    
    func rollBack() { navigationController?.popViewController(animated: true) }

}

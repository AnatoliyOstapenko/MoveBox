//
//  TDDVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 16.07.2022.
//

import UIKit

class TDDVC: UIViewController {
    

    private(set) var volume = 0
    
    func setVolume(value: Int) {
        volume = min(max(value, 0), 99)
    }
    
    func characterCompare(firstString: String, secondString: String) -> Bool    {
        return Set(firstString) == Set(secondString)
    }
    

}

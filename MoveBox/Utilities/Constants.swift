//
//  Constants.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import Foundation
import UIKit

enum SFSymbols {
    static let boxImage = UIImage(systemName: "shippingbox")
    static let keyImage = UIImage(systemName: "key.viewfinder")
    static let combineImage = UIImage(systemName: "comb")
    static let lockImage = UIImage(systemName: "lock")
    static let unlockImage = UIImage(systemName: "lock.open")
    static let swift = UIImage(systemName: "swift")
    static let pattern = UIImage(systemName: "briefcase")
}

enum TabBarTitles {
    static let moveBox = "Move Box"
    static let popUp = "Pop Up"
    static let publisher = "Publisher"
    static let pattern = "Pattern"
}

enum CustomCell {
    static let publisherCell = "publisherCell"
}

enum URLString {
    static let url = URL(string: "https://jsonplaceholder.typicode.com/users")
}

enum CustomText {
    static let text = "Text"
    static let name = "Name"
    static let action = "Update Name"
    static let placeholder = "Enter..."
    static let delegatePattern = "Delegate Protocol Pattern"
    static let observerPattern = "Observer & Notification Pattern"
}

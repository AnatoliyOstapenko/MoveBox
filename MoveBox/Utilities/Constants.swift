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
}

enum TabBarTitles {
    static let moveBox = "Move Box"
    static let popUp = "Pop Up"
    static let publisher = "Publisher"
}

enum CustomCell {
    static let publisherCell = "publisherCell"
}

enum URLString {
    static let url = URL(string: "https://jsonplaceholder.typicode.com/users")
}

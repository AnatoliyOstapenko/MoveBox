//
//  CustomTabBarController.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    let moveBoxImageVeiw = BoxImageView(frame: .zero)
    let popUpImageView = PopUpImageView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    private func setTabBar() {
        viewControllers = [createLeftNV(), createRightNV()]
    }
    
    private func createLeftNV()  -> UINavigationController {
        let vc = MoveBoxVC()
        vc.title = TabBarTitles.moveBox
        vc.tabBarItem = UITabBarItem(title: TabBarTitles.moveBox, image: moveBoxImageVeiw.image, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    private func createRightNV()  -> UINavigationController {
        let vc  = PopUpVC()
        vc.title = TabBarTitles.popUp
        vc.tabBarItem = UITabBarItem(title: TabBarTitles.popUp, image: popUpImageView.image, tag: 1)
        return UINavigationController(rootViewController: vc)
    }
  
}

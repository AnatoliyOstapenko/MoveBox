//
//  CustomTabBarController.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    let moveBoxImageVeiw = GenericImageView(image: .boxImage)

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
        vc.tabBarItem = UITabBarItem(title: TabBarTitles.popUp, image: moveBoxImageVeiw.image, tag: 1)
        return UINavigationController(rootViewController: vc)
    }
  
}

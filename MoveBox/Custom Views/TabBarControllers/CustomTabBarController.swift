//
//  CustomTabBarController.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 03.07.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    private func setTabBar() {
        viewControllers = [createLeftNV(), createPublisherNV(), createRightNV(), createPattern()]
    }
    
    private func createLeftNV()  -> UINavigationController {
        let vc = MoveBoxVC()
        vc.title = TabBarTitles.moveBox
        vc.tabBarItem = UITabBarItem(title: TabBarTitles.moveBox, image: CustomImageView(image: .boxImage).image, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    private func createRightNV()  -> UINavigationController {
        let vc  = UnlockVC()
        vc.title = TabBarTitles.popUp
        vc.tabBarItem = UITabBarItem(title: TabBarTitles.popUp, image: CustomImageView(image: .boxImage).image, tag: 2)
        return UINavigationController(rootViewController: vc)
    }
    
    private func createPublisherNV() -> UINavigationController {
        let vc = PublisherVC()
        vc.title = TabBarTitles.publisher
        vc.tabBarItem = UITabBarItem(title: TabBarTitles.publisher, image: CustomImageView(image: .combineImage).image, tag: 1)
        return UINavigationController(rootViewController: vc)
    }
    
    private func createPattern() -> UINavigationController {
        let vc = PatternVC()
        vc.title = "Delegate Pattern"
        vc.tabBarItem = UITabBarItem(title: TabBarTitles.pattern, image: SFSymbols.pattern, tag: 3)
        return UINavigationController(rootViewController: vc)
        
    }
  
}

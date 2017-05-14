//
//  MenuController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 07.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import UIKit

class MenuTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let contactNavigationController = BaseNavigationController()
        let contactViewModel = ContactViewModel()
        let contactViewController = ContactViewController(viewModel: contactViewModel)
        contactNavigationController.viewControllers = [contactViewController]
        
        let homeViewNavigationController = BaseNavigationController()
        let homeViewController = HomeViewController()
        homeViewNavigationController.viewControllers = [homeViewController]
        
        let controllers = [homeViewNavigationController,
                           contactNavigationController]
        
        self.viewControllers = controllers
        
        homeViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("menu_title_home", comment: ""),
            image: #imageLiteral(resourceName: "ic_home_36pt"),
            tag: 0
        )
        
        contactViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("menu_title_contact", comment: ""),
            image: #imageLiteral(resourceName: "ic_mail_36pt"),
            tag: 1
        )
        
        tabBar.tintColor = UIColor.appColor
        
        
    }

}

//
//  BaseViewControllerWithTabBar.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 07.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//


import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
    }
    
    func setupViews() {
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.titleView?.tintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationBar.barTintColor = UIColor.appColor
        navigationBar.tintColor = UIColor.white
        navigationBar.backgroundColor = UIColor.black
    }
}


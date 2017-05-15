//
//  HomeViewController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 12.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarTitle()
    }
    
    func setupNavigationBarTitle() {
        title = NSLocalizedString("menu_title_home", comment: "")
    }
}


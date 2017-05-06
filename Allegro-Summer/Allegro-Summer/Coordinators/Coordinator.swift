//
//  Coordinator.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 06.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

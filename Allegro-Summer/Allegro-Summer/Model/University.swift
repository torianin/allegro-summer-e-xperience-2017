//
//  University.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 14.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation

class University: NSObject {
    let imageName: String
    let name: String
    let period: String
    
    init(imageName: String, name: String, period: String) {
        self.imageName = imageName
        self.name = name
        self.period = period
    }
}

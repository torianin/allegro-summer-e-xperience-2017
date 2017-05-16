//
//  Project.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 16.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation

class Project {
    let name: String
    let imageNames: [String]
    let details: String
    
    init(name: String, imageNames: [String], details: String ) {
        self.name = name
        self.imageNames = imageNames
        self.details = details
    }
}

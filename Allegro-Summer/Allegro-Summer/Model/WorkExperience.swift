//
//  WorkExperience.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 15.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation

class WorkExperience: NSObject {
    let companyName: String
    let period: String
    let usedTechnologies: String
    let workDetails: String
    let workPlace: String
    
    init(companyName: String, period: String, usedTechnologies: String, workDetails: String, workPlace: String ) {
        self.companyName = companyName
        self.period = period
        self.usedTechnologies = usedTechnologies
        self.workDetails = workDetails
        self.workPlace = workPlace
    }
}

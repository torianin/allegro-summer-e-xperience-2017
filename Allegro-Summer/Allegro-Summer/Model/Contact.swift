//
//  Contact.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 07.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation

class Contact {
    let type: String
    let value: String
    let imageName: String
    let contactDescription: String
    let optionalDisplayedValue: String
    
    init(type: String, value: String, optionalDisplayedValue: String = "", imageName: String, contactDescription: String) {
        self.type = type
        self.value = value
        self.optionalDisplayedValue = optionalDisplayedValue
        self.imageName = imageName
        self.contactDescription = contactDescription
    }
}

enum ContactType {
    case email, phone_number, sms, web_page, linkedin
}

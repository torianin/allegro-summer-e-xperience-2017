//
//  Allegro_SummerTests.swift
//  Allegro-SummerTests
//
//  Created by Robert Ignasiak on 17.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import XCTest

class Allegro_SummerTests: XCTestCase {
    
    func testPhoneNumer(){
        let contact = Contact(type: "phone_number", value: "+48794070872", imageName: "contact_phone", contactDescription: "Kontakt telefoniczny")
        
        XCTAssertEqual(contact.type, "phone_number")
        XCTAssertEqual(contact.value.characters.count, 12)
    }
    
    func testEmail(){
        let contact = Contact(type: "email", value: "praca@robert-i.com", imageName: "contact_mail", contactDescription: "Kontakt Email")
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        XCTAssertTrue(emailTest.evaluate(with: contact.value))
    }
    
    
    func testProjectWithNoImages() {
        let project = Project(name: "Łazik marsjański - 2015", details: "Budowa łazika marsjańskiego w ramach koła studenckiego Continuum.")
        
        XCTAssertTrue(project.imageNames.isEmpty)
    }
}

//
//  ContactViewModel.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 07.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import RxSwift

final class ContactViewModel {
    
    private let disposeBag = DisposeBag()
    
    let modelSelected = PublishSubject<Contact>()
    
    let contacts = Observable.just([
        Contact(type: "phone_number", value: "+48794070872", imageName: "contact_phone", contactDescription: "Kontakt telefoniczny"),
        Contact(type: "sms", value: "+48794070872", imageName: "contact_sms", contactDescription: "Kontakt SMS"),
        Contact(type: "email", value: "praca@robert-i.com", imageName: "contact_mail", contactDescription: "Kontakt Email"),
        Contact(type: "web_page", value: "http://www.robert-i.com", optionalDisplayedValue: "www.robert-i.com", imageName: "contact_webpage", contactDescription: "Strona Internetowa"),
        Contact(type: "linkedin", value: "torianin", imageName: "contact_linkedin", contactDescription: "LinkedIn")
        ])
}

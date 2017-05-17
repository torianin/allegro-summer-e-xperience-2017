//
//  WorkExperienceViewModel.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 15.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import RxSwift

final class WorkExperienceViewModel {
    private let disposeBag = DisposeBag()

    let workExperience = Variable<[WorkExperience]> ( [
        WorkExperience(companyName: "TheMasters", period: "06.2015 - 10.2015", usedTechnologies: "Swift, CocoaPods, REST API, Crashlytics", workDetails: "Skaner kodów do inwentaryzacji oraz innych procesów logistycznych w magazynie.", workPlace: "Wrocław",imageNames: ["themasters"]),
        WorkExperience(companyName: "Rails Masters", period: "06.2014-10.2014", usedTechnologies: "Ruby on Rails, Haml, CoffeeScript, Phonegap, Testing", workDetails: "Back-End Developer aplikacji na tablety (Phonegap).", workPlace: "Wrocław", imageNames: ["railsmasters"]),
        WorkExperience(companyName: "Techland", period: "07.2013 - 08.2013", usedTechnologies: "C++, Cocos2d-x, Android SDK", workDetails: "Aplikacja na iOS i Android do nauki interwałów.", workPlace: "Wrocław", imageNames:["techland1", "techland2", "techland3"]),
        WorkExperience(companyName: "nk.pl", period: "01.2012 - 04.2012", usedTechnologies: "Phonegap, Testing", workDetails: "", workPlace: "Wrocław")
        ])
    
}

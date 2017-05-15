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
        WorkExperience(companyName: "TheMasters", period: "06.2015 - 10.2015", usedTechnologies: "Swift, CocoaPods, REST API, Crashlytics", workDetails: "Scanner app for warehousing. Submitted and accepted into AppStore", workPlace: "Wrocław"),
        WorkExperience(companyName: "Rails Masters", period: "06.2014-10.2014", usedTechnologies: "Ruby on Rails, Haml, CoffeeScript, Phonegap, Testing", workDetails: "Back-End Developer of Phonegap apps for tablets", workPlace: "Wrocław"),
        WorkExperience(companyName: "Techland", period: "07.2013 - 08.2013", usedTechnologies: "C++, Cocos2d-x, Android SDK", workDetails: "Create music learning software for iOS and Android", workPlace: "Wrocław"),
        WorkExperience(companyName: "nk.pl", period: "01.2012 - 04.2012", usedTechnologies: "Phonegap, Testing", workDetails: "", workPlace: "Wrocław")
        ])
    
}

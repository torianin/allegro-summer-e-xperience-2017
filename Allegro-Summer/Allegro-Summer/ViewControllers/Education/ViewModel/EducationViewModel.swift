//
//  EducationViewModel.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 12.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import RxSwift

final class EducationViewModel {
    
    private let disposeBag = DisposeBag()
    
    let selectedUniversity = PublishSubject<University>()
    
    let universities = Variable<[University]>([
        University(imageName: "pwr", name: "Wrocław University of Science and Technology", period: "2015-2017"),
        University(imageName: "university_aveiro", name: "Universidade de Aveiro", period: "2016"),
        University(imageName: "university_wroclaw", name: "University of Wroclaw", period: "2011-2015")
        ])
    
    let languages = Variable<[Language]>([
        Language(imageName: "english", name: "English", level: "Advanced Mid"),
        Language(imageName: "german", name: "German", level: "Novice"),
        Language(imageName: "portuguese", name: "Portuguese", level: "Novice")
        ])
}

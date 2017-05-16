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
        University(imageName: "pwr", name: "Politechnika Wrocławska", period: "2015-2017"),
        University(imageName: "university_aveiro", name: "Universidade de Aveiro", period: "2016"),
        University(imageName: "university_wroclaw", name: "Uniwersytet Wrocławski", period: "2011-2015")
        ])
    
    let languages = Variable<[Language]>([
        Language(imageName: "english", name: "Język angielski", level: "wysokozaawansowany"),
        Language(imageName: "german", name: "Język niemiecki", level: "podstawowy"),
        Language(imageName: "portuguese", name: "Język portugalski", level: "podstawowy")
        ])
}

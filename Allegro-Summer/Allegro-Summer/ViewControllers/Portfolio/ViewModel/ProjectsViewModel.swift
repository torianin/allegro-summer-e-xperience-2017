//
//  ProjectsViewModel.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 16.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import RxSwift

final class ProjectsViewModel {
    private let disposeBag = DisposeBag()
    
    let projects = Variable<[Project]> ( [
        Project(name: "Aplikacja Auto Stop Race", imageNames: [""], details: "Dedykowana aplikacja mobilna dla użytkowników największego wyścigu autostopowego w Europie - Auto Stop Race.")
        ])
    
}

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
        Project(name: "Aplikacja Auto Stop Race - 2017", imageNames: ["asr1","asr2","asr3"], details: "Dedykowana aplikacja mobilna dla użytkowników największego wyścigu autostopowego w Europie - Auto Stop Race."),
        Project(name: "Łazik marsjański - 2015", imageNames: ["con1","con2"], details: "Budowa łazika marsjańskiego w ramach koła studenckiego Continuum."),
        Project(name: "JugglyBoy - 2014", imageNames: ["jugglyboy"], details: "Gra stworzona wraz z pracownią architektoniczną w Objective-C (Cocos2d). W 2017 przepisałem ją do Swift 3.0."),
        Project(name: "Pubtraffic - 2013", imageNames: ["pubtraffic"], details: "Projekt na studia. Portal społecznościowy o aktywności w pubach z wykorzystaniem kard RFID."),
        Project(name: "FatAngelOnline - 2013", imageNames: ["multiplayer"], details: "Projekt na studia. Gra multiplayer wykonana w Ruby (Sinatra) z wykorzystaniem technologii WebSocket"),
        Project(name: "Konturówka - 2007", imageNames: ["flash"], details: "Mój pierwszy \"projekt\" wykonany w technologii Flash. Od niego wszystko się zaczęło... ;)")
        ])
    
}

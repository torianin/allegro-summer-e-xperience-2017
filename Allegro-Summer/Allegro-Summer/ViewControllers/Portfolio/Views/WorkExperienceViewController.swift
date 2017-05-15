//
//  WorkExperienceViewController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 15.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class WorkExperienceViewController: UIViewController, UITableViewDelegate {
    var viewModel: WorkExperienceViewModel!
    let disposeBag = DisposeBag()
        
    let workExperienceTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    
    convenience init(viewModel: WorkExperienceViewModel) {
        self.init()
        
        self.viewModel = viewModel
        
        setupWorkTableView()
    }
    
    func setupWorkTableView() {
        workExperienceTableView.register(WorkExperienceCell.self, forCellReuseIdentifier: WorkExperienceCell.Identifier)
        
        viewModel.workExperience.asObservable()
            .bindTo(workExperienceTableView.rx.items) { tableView, i, item in
                let indexPath = IndexPath(row: i, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: WorkExperienceCell.Identifier, for: indexPath) as! WorkExperienceCell
                cell.workExperience = item
                return cell
            }.addDisposableTo(disposeBag)
        
        workExperienceTableView.separatorStyle = .none
        
        workExperienceTableView.rx.setDelegate(self).addDisposableTo(disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(workExperienceTableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        workExperienceTableView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(800)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

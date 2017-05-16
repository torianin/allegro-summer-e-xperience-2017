//
//  ProjectsViewController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 16.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ProjectsViewController: UIViewController, UITableViewDelegate {
    var viewModel: ProjectsViewModel!
    let disposeBag = DisposeBag()
    
    let projectsExperienceTableView: UITableView =  {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    
    convenience init(viewModel: ProjectsViewModel) {
        self.init()
        self.viewModel = viewModel
        setupProjectTableView()
    }
    
    func setupProjectTableView() {
        projectsExperienceTableView.register(ProjectCell.self, forCellReuseIdentifier: ProjectCell.Identifier)
        
        projectsExperienceTableView.register(PortfolioHeaderCell.self, forCellReuseIdentifier: PortfolioHeaderCell.Identifier)
        
        let headerCell = projectsExperienceTableView.dequeueReusableCell(withIdentifier: PortfolioHeaderCell.Identifier) as! PortfolioHeaderCell
        headerCell.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        headerCell.headerText = NSLocalizedString("projects_title" , comment: "")
        
        projectsExperienceTableView.tableHeaderView = headerCell
        
        viewModel.projects.asObservable()
            .bindTo(projectsExperienceTableView.rx.items) { tableView, i, item in
                let indexPath = IndexPath(row: i, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.Identifier, for: indexPath) as! ProjectCell
                cell.project = item
                return cell
            }.addDisposableTo(disposeBag)
        
        projectsExperienceTableView.separatorStyle = .none
        
        projectsExperienceTableView.rx.setDelegate(self).addDisposableTo(disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(projectsExperienceTableView)
        setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        projectsExperienceTableView.snp.remakeConstraints { (make) -> Void in
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

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
import SKPhotoBrowser

class ProjectsViewController: UIViewController, UITableViewDelegate {
    var viewModel: ProjectsViewModel!
    let disposeBag = DisposeBag()
    
    let tableViewHeight = 750
    
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
        
        projectsExperienceTableView.rx.modelSelected(Project.self)
            .subscribe(onNext: { project in
                if !project.imageNames.isEmpty {
                    var images = [SKPhoto]()
                    for imageName in project.imageNames {
                        let image = UIImage(named: imageName)?.imageWithInsets(insets: UIEdgeInsets(top: 100, left: 5, bottom: 100, right: 5))
                        let photo = SKPhoto.photoWithImage(image!)
                        images.append(photo)
                    }
                    
                    let browser = SKPhotoBrowser(photos: images)
                    browser.initializePageIndex(0)
                    self.navigationController?.present(browser, animated: true, completion: {})
                }
            })
            .addDisposableTo(disposeBag)
        
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
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(tableViewHeight)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

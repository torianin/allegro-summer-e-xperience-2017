//
//  EducationViewController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 12.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa


class EducationViewController: UIViewController, UITableViewDelegate {
    var viewModel: EducationViewModel!
    let disposeBag = DisposeBag()
    
    let universitiesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    
    var separator: UIView = {
        let separator = UIView(frame: CGRect.init())
        separator.backgroundColor = UIColor.gray
        return separator
    }()
    
    let languagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    
    convenience init(viewModel: EducationViewModel) {
        self.init()
        
        self.viewModel = viewModel
        
        setupUniversitiesTableView()
        setupLanguagesTableView()
    }
    
    func setupUniversitiesTableView() {
        universitiesTableView.register(EducationCell.self, forCellReuseIdentifier: EducationCell.Identifier)
        
        viewModel.universities.asObservable()
            .bindTo(universitiesTableView.rx.items) { tableView, i, item in
                let indexPath = IndexPath(row: i, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: EducationCell.Identifier, for: indexPath) as! EducationCell
                cell.university = item
                return cell
            }.addDisposableTo(disposeBag)
        
        universitiesTableView.separatorStyle = .none
        
        universitiesTableView.rx.setDelegate(self).addDisposableTo(disposeBag)
    }
    
    func setupLanguagesTableView() {
        languagesTableView.register(EducationCell.self, forCellReuseIdentifier: EducationCell.Identifier)
        
        viewModel.languages.asObservable()
            .bindTo(languagesTableView.rx.items) { tableView, i, item in
                let indexPath = IndexPath(row: i, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: EducationCell.Identifier, for: indexPath) as! EducationCell
                cell.language = item
                return cell
            }.addDisposableTo(disposeBag)
        
        languagesTableView.separatorStyle = .none
        
        languagesTableView.rx.setDelegate(self).addDisposableTo(disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle()
        
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(universitiesTableView)
        view.addSubview(languagesTableView)
        setupConstraints()
    }
    
    func setupNavigationBarTitle() {
        title = NSLocalizedString("menu_title_education", comment: "")
    }

    override func viewWillLayoutSubviews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        if UIApplication.shared.statusBarOrientation.isLandscape {
            universitiesTableView.snp.remakeConstraints { (make) -> Void in
                make.top.equalTo(topLayoutGuide.snp.bottom)
                make.left.equalTo(view)
                make.height.equalTo(240)
                make.width.equalTo(view).dividedBy(2)
            }
            
            languagesTableView.snp.remakeConstraints { (make) -> Void in
                make.top.equalTo(topLayoutGuide.snp.bottom)
                make.right.equalTo(view)
                make.height.equalTo(240)
                make.width.equalTo(view).dividedBy(2)
            }
        } else {
            universitiesTableView.snp.remakeConstraints { (make) -> Void in
                make.top.equalTo(topLayoutGuide.snp.bottom)
                make.left.right.equalTo(view)
                make.height.equalTo(240)
                make.width.equalToSuperview()
            }
            
            languagesTableView.snp.remakeConstraints { (make) -> Void in
                make.left.right.equalTo(view)
                make.top.equalTo(universitiesTableView.snp.bottom)
                make.height.equalTo(240)
                make.width.equalToSuperview()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

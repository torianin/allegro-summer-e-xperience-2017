//
//  PortfolioViewController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 15.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit

class PortfolioViewController: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let workExperienceViewController:WorkExperienceViewController = {
        let viewModel = WorkExperienceViewModel()
        let viewController = WorkExperienceViewController(viewModel: viewModel)
        return viewController
    }()
    
    let projectsViewController:ProjectsViewController = {
        let viewModel = ProjectsViewModel()
        let viewController = ProjectsViewController(viewModel: viewModel)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle()
        setupStackView()
        setupConstraints()
    }
    
    func setupNavigationBarTitle() {
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("menu_title_experience", comment: "")
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(workExperienceViewController.view)
        stackView.addArrangedSubview(projectsViewController.view)

        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        self.view.layoutIfNeeded()
    }
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        
        scrollView.snp.remakeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.remakeConstraints{ (make) -> Void in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(1600)
        
        }
    }
    
}


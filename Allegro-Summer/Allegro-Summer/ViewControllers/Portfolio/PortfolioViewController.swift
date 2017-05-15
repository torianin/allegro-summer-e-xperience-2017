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
        stackView.distribution = .fillEqually
        stackView.spacing = 2
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarTitle()
        setupStackView()
        setupConstraints()
    }
    
    func setupNavigationBarTitle() {
        title = NSLocalizedString("menu_title_experience", comment: "")
    }
    
    func setupStackView() {
        
        addChildViewController(workExperienceViewController)
        stackView.addArrangedSubview(workExperienceViewController.view)
        workExperienceViewController.didMove(toParentViewController: self)
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        self.view.layoutIfNeeded()
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{ (make) -> Void in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(UIScreen.main.bounds.height)
        
        }
    }
    
}


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
        setupHelpBarButton()
        setupScrollView()
        setupConstraints()
    }
    
    func setupNavigationBarTitle() {
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("menu_title_experience", comment: "")
    }
    
    func setupHelpBarButton() {
        let menuImage = UIImage(named: "ic_help_outline_white")?.withRenderingMode(.alwaysOriginal)
        let menuBarButtonItem = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(handleHelpTap))
        navigationItem.rightBarButtonItems = [menuBarButtonItem]
    }
    
    func handleHelpTap() {
        let alert = UIAlertController(title: NSLocalizedString("menu_help", comment: ""), message:NSLocalizedString("msg_login_info", comment: "") , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupScrollView() {
        let width = UIScreen.main.bounds.width
        
        let height = CGFloat( workExperienceViewController.tableViewHeight +
            projectsViewController.tableViewHeight )
        
        scrollView.contentSize = CGSize.init(width: UIScreen.main.bounds.width, height: height)
        
        var y:CGFloat = 0
        
        let viewControllers = [workExperienceViewController, projectsViewController]

        for viewController in viewControllers {
            addChildViewController(viewController)
            let originY:CGFloat = y
            viewController.view.frame = CGRect.init(x: 0, y: originY, width: width, height: viewController.view.frame.height)
            scrollView.addSubview(viewController.view)
            viewController.didMove(toParentViewController: self)
            y += viewController.view.frame.height
        }
        
        view.addSubview(scrollView)

    }
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        
        scrollView.snp.remakeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
}


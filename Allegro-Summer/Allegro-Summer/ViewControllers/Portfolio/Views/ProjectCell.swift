//
//  ProjectCell.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 16.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class ProjectCell: BaseUITableViewCell {
    static let Identifier = "ProjectCell"
    
    var project: Project? {
        didSet {
            if let projectName = project?.name {
                if !project!.imageNames.isEmpty {
                    nameLabel.text = "\(projectName) 📱"
                } else {
                    nameLabel.text = projectName
                }
            }
            
            if let projectDetails = project?.details {
                detailsLabel.text = projectDetails
            }
        }
    }
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightBold)
        return label
    }()
    
    var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightLight)
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()

        self.addSubview(nameLabel)
        self.addSubview(detailsLabel)

        setupConstraints()
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(self).offset(10)
        }
        
        detailsLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.width.equalTo(UIScreen.main.bounds.width - 60)
        }
    }
}

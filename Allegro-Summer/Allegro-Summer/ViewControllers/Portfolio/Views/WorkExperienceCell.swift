//
//  WorkExperienceCell.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 15.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class WorkExperienceCell: BaseUITableViewCell {
    static let Identifier = "WorkExperienceCell"
    
    var workExperience: WorkExperience? {
        didSet {
            if let companyName = workExperience?.companyName {
                companyNameLabel.text = companyName
            }
            
            if let period = workExperience?.period {
                periodLabel.text = period
            }
            
            if let workPlace = workExperience?.workPlace {
                workPlaceLabel.text = workPlace
            }
            
            if let usedTechnologies = workExperience?.usedTechnologies {
                usedTechnologiesLabel.text = usedTechnologies
            }
            
            if let workDetails = workExperience?.workDetails {
                workDetailsLabel.text = workDetails
            }
        }
    }
    
    var companyNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFontWeightBold)
        return label
    }()
    
    var periodLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightThin)
        return label
    }()
    
    var workPlaceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightThin)
        return label
    }()
    
    var usedTechnologiesLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightLight)
        return label
    }()
    
    var workDetailsLabel: UILabel = {
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

        self.addSubview(periodLabel)
        self.addSubview(workPlaceLabel)
        self.addSubview(companyNameLabel)
        self.addSubview(usedTechnologiesLabel)
        self.addSubview(workDetailsLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        periodLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(self).offset(10)
        }
        
        workPlaceLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-30)
            make.top.equalTo(self).offset(10)
        }
        
        companyNameLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(periodLabel.snp.bottom).offset(10)
        }
        
        usedTechnologiesLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(companyNameLabel.snp.bottom).offset(10)
            make.width.equalTo(self).offset(-50)
        }
        
        workDetailsLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(usedTechnologiesLabel.snp.bottom).offset(10)
            make.width.equalTo(self).offset(-50)
        }
    }
}

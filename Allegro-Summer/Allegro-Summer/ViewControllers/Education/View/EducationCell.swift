//
//  EducationCell.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 12.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class EducationCell: BaseUITableViewCell {
    static let Identifier = "EducationCell"
    
    var university: University? {
        didSet {
            if let imageName = university?.imageName {
                logoImageView.image = UIImage(named: imageName)
            }
            
            if let universityName = university?.name {
                nameLabel.text = universityName
            }
            
            if let description = university?.period {
                descriptionLabel.text = description
            }
        }
    }
    
    var language: Language? {
        didSet {
            if let imageName = language?.imageName {
                logoImageView.image = UIImage(named: imageName)
            }
            
            if let languageName = language?.name {
                nameLabel.text = languageName
            }
            
            if let description = language?.level {
                descriptionLabel.text = description
            }
        }
    }
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var nameLabel: UILabel  = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightLight)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightBold)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.appColor
        return label
    }()

    override func setupViews() {
        super.setupViews()
        
        self.addSubview(logoImageView)
        self.addSubview(nameLabel)
        self.addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(15)
            make.centerY.equalTo(self)
            make.height.width.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(logoImageView.snp.right).offset(15)
            make.top.equalTo(self.snp.top).offset(14)
            make.right.equalTo(self)
        }
        
        descriptionLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(logoImageView.snp.right).offset(15)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.right.equalTo(self)
        }
    }

}

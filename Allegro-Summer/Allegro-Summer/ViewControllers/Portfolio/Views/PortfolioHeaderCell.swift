//
//  PortfolioHeaderCell.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 15.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class PortfolioHeaderCell: BaseUITableViewCell {
    static let Identifier = "PortfolioHeaderCell"
    
    var headerText: String? {
        didSet {
            if let headerText = headerText {
                headerTextLabel.text = headerText
            }
        }
    }
    
    var headerTextLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightLight)
        label.textColor = UIColor.appColor
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.addSubview(headerTextLabel)
 
        setupConstraints()
    }
    
    func setupConstraints() {
        headerTextLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.top.equalTo(self).offset(20)
        }
    }
}

//
//  BaseUITableViewCell.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 15.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit

class BaseUITableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

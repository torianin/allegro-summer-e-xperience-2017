//
//  HomeViewController.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 12.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var backgroundImageView: UIView!

    var helloTextLabel: UILabel = {
        let label = UILabel()
        
        let text = NSLocalizedString("welcome_text", comment: "")
        let textAttributes = [ NSForegroundColorAttributeName: UIColor.white,
                               NSBackgroundColorAttributeName: UIColor.appColor]
        
        let attributedString = NSAttributedString(string: text, attributes: textAttributes)
        
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightBold)
        label.attributedText = attributedString
        return label
    }()
    
    var infoTextLabel: UILabel = {
        let label = UILabel()
        
        let text = NSLocalizedString("home_info_text", comment: "")
        let textAttributes = [ NSForegroundColorAttributeName: UIColor.white]
        let attributedString = NSAttributedString(string: text, attributes: textAttributes)
        
        label.numberOfLines = 10
        label.lineBreakMode = .byTruncatingTail
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightBold)
        label.attributedText = attributedString
        
        return label
    }()
    
    let myPhotoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "robercik"))
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundImage()
        
        view.addSubview(myPhotoImageView)
        view.addSubview(helloTextLabel)
        view.addSubview(infoTextLabel)
        
        setupConstraints()
    }

    func setupBackgroundImage() {
        let backgroundImageView = UIImageView.init(image: UIImage(named: "homebackground"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.frame
        view.addSubview(backgroundImageView)
    }
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }

    func setupConstraints() {
        if UIApplication.shared.statusBarOrientation.isLandscape {
            helloTextLabel.snp.remakeConstraints { (make) -> Void in
                make.top.equalTo(view).offset(10)
                make.left.equalTo(view).offset(30)
                make.width.equalTo(view).dividedBy(2)
            }
            
            infoTextLabel.snp.remakeConstraints { (make) -> Void in
                make.left.equalTo(view).offset(30)
                make.top.equalTo(helloTextLabel.snp.bottom).offset(10)
                make.width.equalTo(view).dividedBy(2)
            }
            
            myPhotoImageView.snp.remakeConstraints { (make) -> Void in
                make.left.equalTo(infoTextLabel.snp.right)
                make.right.equalTo(view)
                make.bottom.equalTo(bottomLayoutGuide.snp.top)
                make.width.equalTo(view).dividedBy(2)
                make.height.equalTo(myPhotoImageView.snp.width).multipliedBy( 1303.0 / 1833.0)
            }
        } else {
            helloTextLabel.snp.remakeConstraints { (make) -> Void in
                make.top.equalTo(view).offset(50)
                make.left.equalTo(view).offset(30)
            }
            
            infoTextLabel.snp.remakeConstraints { (make) -> Void in
                make.left.equalTo(view).offset(30)
                make.top.equalTo(helloTextLabel.snp.bottom).offset(30)
                make.width.equalTo(view).offset(-60)
            }
            
            myPhotoImageView.snp.remakeConstraints { (make) -> Void in
                make.left.right.equalTo(view)
                make.bottom.equalTo(bottomLayoutGuide.snp.top)
                make.width.equalTo(view)
                make.height.equalTo(myPhotoImageView.snp.width).multipliedBy( 1303.0 / 1833.0)
            }
        }
    }
}


//
//  UIColor.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 11.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    // Code by Ethan Strider
    
    convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    open class var appColor: UIColor {
        get {
            return UIColor.init(hex: "#be0004")
        }
    }
    
    open class var backgroundAppColor: UIColor {
        get {
            return UIColor.init(hex: "#c3bfd6")
        }
    }
}

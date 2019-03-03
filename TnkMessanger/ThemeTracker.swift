//
//  ThemeTracker.swift
//  TnkMessanger
//
//  Created by Никита on 03/03/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation
import UIKit

@objcMembers class ThemeTracker: NSObject{
    static var currentTheme = UIColor.white
    
    @objc class func setTheme (_ color: UIColor) {
        ThemeTracker.currentTheme = color
    }
}


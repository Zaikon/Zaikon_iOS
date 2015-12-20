//
//  UIColoer+Extension.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/17.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func lightGrey() -> UIColor {
        return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
    }
    
    class func Grey() -> UIColor {
        return UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
    }
    
    class func lightBlue() -> UIColor {
        return UIColor(red: 75/255, green: 199/255, blue: 241/255, alpha: 1)
    }
    
    class func plusBtnColor() -> UIColor {
        return  UIColor(red: 236/255, green: 0, blue: 20/255, alpha: 1)
    }
    
    class func minusBtnColor() -> UIColor {
        return  UIColor(red: 65/255, green: 187/255, blue: 237/255, alpha: 1)
    }
}
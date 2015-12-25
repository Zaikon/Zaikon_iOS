//
//  CALayer+Extension.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/25.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

extension CALayer {
    class func borderlineTextfield(textField: UITextField) {
        let borderBottom = CALayer()
        let borderWidth: CGFloat = 1
        
        borderBottom.removeFromSuperlayer()
        borderBottom.frame = CGRectMake(0, textField.frame.height - borderWidth, textField.frame.width, borderWidth)
        borderBottom.backgroundColor = UIColor(red: 204/225, green: 204/225, blue: 204/225, alpha: 1).CGColor
        textField.layer.addSublayer(borderBottom)

    }
}
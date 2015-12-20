//
//  UIView+Extension.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/20.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

extension UIView {
    class func setGradationView(view: UIView) {
        
        let topColor = UIColor.whiteColor()
        let middleColor = UIColor(red: 147/255, green: 217/255, blue: 241/255, alpha: 1)
        let bottomColor = UIColor.lightBlue()
        let gradientColors: [CGColor] = [bottomColor.CGColor, bottomColor.CGColor, middleColor.CGColor, middleColor.CGColor, topColor.CGColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = view.frame
        view.layer.insertSublayer(gradientLayer, atIndex: 0)
    }
}

//
//  UIImageView+Extension.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/19.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func diplayImageView(imageURL:String) -> UIImage {
        let url = NSURL(string: imageURL)
        
        guard let imageData: NSData = NSData(contentsOfURL: (contentsOfURL: url!))! else {
            print("Error: can't create image, check URL")
        }
            let image = UIImage(data: imageData)
            return image!
    }

}


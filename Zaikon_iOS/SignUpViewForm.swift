//
//  SignUpViewForm.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/20.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class SignUpViewForm: UIView {
    
    class func instance() -> SignUpViewForm {
        
        return UINib(nibName: "SignUpViewForm", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! SignUpViewForm
    }

}

//
//  LoginViewForm.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/20.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class LoginViewForm: UIView {
    
    class func instance() -> LoginViewForm {
        
        return UINib(nibName: "LoginViewForm", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! LoginViewForm
    }

}

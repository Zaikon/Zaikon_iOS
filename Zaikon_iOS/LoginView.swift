//
//  LoginView.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/19.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class LoginView: UIView {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    class func instance() -> LoginView {
        
        return UINib(nibName: "LoginView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! LoginView
    }
    
    func setViewEffect() {
        UIView.setGradationView(self)
        loginButton.layer.cornerRadius = 5
        signUpButton.layer.cornerRadius = 5
    }
}

//
//  loginViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/09.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var loginView: LoginView!
    var loginFormView: LoginViewForm!
    var signFormView: SignUpViewForm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView = LoginView.instance()
        loginView.frame = self.view.frame
        loginView.setViewEffect()
        
        loginView.loginButton.addTarget(self, action: "tapLoginButton:", forControlEvents: .TouchUpInside)
        loginView.signUpButton.addTarget(self, action: "tapSignUpButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(loginView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapLoginButton(sender: UIButton) {
        loginFormView = LoginViewForm.instance()
        loginFormView.frame.origin = CGPointMake(0, self.view.frame.height)
        loginFormView.setViewEffect()
        self.view.addSubview(loginFormView)
    }
    
    func tapSignUpButton(sender: UIButton) {
        signFormView = SignUpViewForm.instance()
        signFormView.frame.origin = CGPointMake(0, self.view.frame.height)
        signFormView.setViewEffect()
        self.view.addSubview(signFormView)
    }
    
 }

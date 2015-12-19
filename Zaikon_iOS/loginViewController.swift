//
//  loginViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/09.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = LoginView.instance()
        loginView.frame = self.view.frame
        loginView.addBorderEffect(loginView.signUpButton)
        loginView.addBorderEffect(loginView.loginButton)
        UIView.setGradationView(loginView)
        self.view.addSubview(loginView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 }

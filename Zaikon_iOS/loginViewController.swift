//
//  loginViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/09.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit
import SwiftyJSON

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
        loginFormView.LoginStartButton.addTarget(self, action: "tapLoginStartButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(loginFormView)
    }
    
    func tapSignUpButton(sender: UIButton) {
        
        signFormView = SignUpViewForm.instance()
        signFormView.frame.origin = CGPointMake(0, self.view.frame.height)
        signFormView.setViewEffect()
        signFormView.signUpStartButton.addTarget(self, action: "tapSignUpStartButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(signFormView)
    }
    
    func tapLoginStartButton(sender: UIButton) {
        
        let email = self.loginFormView.emailTextField.text
        let password = self.loginFormView.passwordTextField.text
        
        let attribute: JSON = [
            "email": email!,
            "password": password!
        ]
        let user = User(attribute: attribute)
        user.login { () -> Void in
            print("hoge")
        }
    }
    
    func tapSignUpStartButton(sender: UIButton) {
        let name = signFormView.nameTextField.text
        let email = signFormView.emailTextField.text
        let password = signFormView.passwordTextField.text
        let passwordConfirmation = signFormView.passwordConfirmationTextField.text
        
        let attribute: JSON = [
            "name": name!,
            "email": email!,
            "password": password!,
            "password_confirmation": passwordConfirmation!,
        ]
        
        let user = User(attribute: attribute)
        user.signUp { () -> Void in
            print("hoge")
        }

    }
    
 }

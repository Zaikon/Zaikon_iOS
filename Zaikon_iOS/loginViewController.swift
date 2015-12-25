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
    var currentUser = CurrentUser.sharedCurrentUser
    
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
        if isEmptyLoginForm() {
            showAlertView()
        } else {
            registerLoginUser()
        }
    }
    
    func tapSignUpStartButton(sender: UIButton) {

        if isEmptySignUpForm() {
            showAlertView()
        } else {
            registerSignUpUser()
        }

    }
    
    func isEmptyLoginForm() -> Bool{
        print(String.strEmpty(loginFormView.emailTextField.text) && String.strEmpty(loginFormView.passwordTextField.text))
        return String.strEmpty(loginFormView.emailTextField.text) && String.strEmpty(loginFormView.passwordTextField.text)
    }
    
    func isEmptySignUpForm() -> Bool {
        let bool: Bool = String.strEmpty(signFormView.nameTextField.text) && String.strEmpty(signFormView.emailTextField.text) && String.strEmpty(signFormView.passwordTextField.text) &&  String.strEmpty(signFormView.passwordConfirmationTextField.text) && signFormView.passwordTextField.text == signFormView.passwordConfirmationTextField.text
        return bool
    }
    
    func registerLoginUser() {
        
        let email = self.loginFormView.emailTextField.text
        let password = self.loginFormView.passwordTextField.text
        
        let attribute: JSON = [
            "email": email!,
            "password": password!
        ]
        
        let user = User(attribute: attribute)
        user.login { () -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }
    
    func registerSignUpUser() {
        
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
            user.login({ () -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }
    }
    
    func showAlertView() {
        
        let alertController = UIAlertController(title: "Error", message: "Fill in Your Form", preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(alertAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
 
}
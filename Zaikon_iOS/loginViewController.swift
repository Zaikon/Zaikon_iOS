//
//  loginViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/09.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.secureTextEntry = true
        makeLoginButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeLoginButton() {
        loginButton.layer.cornerRadius = 3
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

//
//  LoginViewForm.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/20.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class LoginViewForm: UIView, UITextFieldDelegate {
    @IBOutlet weak var loginForm: UIView!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var removeViewButton: UIButton!
    @IBOutlet weak var LoginStartButton: UIButton!
    
    @IBOutlet weak var dockViewHeightConstrain: NSLayoutConstraint!
    
    class func instance() -> LoginViewForm {
        
        return UINib(nibName: "LoginViewForm", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! LoginViewForm
    }
    
    func setViewEffect() {
        loginForm.layer.cornerRadius = 5
        LoginStartButton.layer.cornerRadius = 8
        showLoginForm()
        underlineTextField()
    }
    
    override func awakeFromNib() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "loginFormTapped")
        removeViewButton.addTarget(self, action: "removeLoginView", forControlEvents: .TouchUpInside)
        self.addGestureRecognizer(tapGesture)
        
        passwordTextField.delegate = self
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "showKeyBoard:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "hideKeyBoard:", name:UIKeyboardWillHideNotification, object: nil)
    }
    
    func underlineTextField() {
        CALayer.borderlineTextfield(emailTextField)
        CALayer.borderlineTextfield(passwordTextField)
    }

    
    
    func showKeyBoard(notification: NSNotification) {
        
        let keyboardRect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue
        UIView.animateWithDuration(0.25, animations: {
            self.dockViewHeightConstrain.constant = (keyboardRect?.size.height)!
            self.layoutIfNeeded()
            }, completion: nil)
    }
    
    func hideKeyBoard(notification: NSNotification) {
        
        UIView.animateWithDuration(0.25, animations: {
            self.dockViewHeightConstrain.constant = 10
            self.layoutIfNeeded()
            }, completion: nil)
    }
    
    func loginFormTapped() {
        
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func showLoginForm() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame.origin = CGPointMake(0, 0)
        })
    }
    
    func removeLoginView() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame.origin = CGPointMake(0, self.frame.height)
        })
    }


}

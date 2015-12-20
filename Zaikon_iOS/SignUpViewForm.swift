//
//  SignUpViewForm.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/20.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class SignUpViewForm: UIView, UITextFieldDelegate {
    @IBOutlet weak var signUpForm: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    @IBOutlet weak var removeViewButton: UIButton!
    @IBOutlet weak var signUpStartButton: UIButton!
    
    @IBOutlet weak var dockViewHeightConstrain: NSLayoutConstraint!
    
    
    class func instance() -> SignUpViewForm {

        return UINib(nibName: "SignUpViewForm", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! SignUpViewForm
    }
    
    func setViewEffect() {
        
        removeViewButton.addTarget(self, action: "removeSignUpView", forControlEvents: .TouchUpInside)
        signUpStartButton.layer.cornerRadius = 5
        signUpForm.layer.cornerRadius = 8
        showSignUpForm()
    }
    
    override func awakeFromNib() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "signUpFormTapped")
        self.addGestureRecognizer(tapGesture)
        
        passwordConfirmationTextField.delegate = self
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "showKeyBoard:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "hideKeyBoard:", name:UIKeyboardWillHideNotification, object: nil)
    }
    
    func showKeyBoard(notification: NSNotification) {
        
        let keyboardRect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue
        UIView.animateWithDuration(0.25, animations: {
            print(keyboardRect?.size.height)
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
    
    func signUpFormTapped() {
        
        nameTextField.endEditing(true)
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        passwordConfirmationTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func showSignUpForm() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame.origin = CGPointMake(0, 0)
        })
    }
    
    func removeSignUpView() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame.origin = CGPointMake(0, self.frame.height)
        })
    }
}

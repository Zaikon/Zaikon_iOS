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
    @IBOutlet weak var dockViewHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var iconBackGroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.secureTextEntry = true
        makeLoginButton()
        makeIconBackGroundView()
        
        //画像タップ時に検出するジェスチャーの設定
        let tapGesture = UITapGestureRecognizer(target: self, action: "loginPageTapped")
        self.view.addGestureRecognizer(tapGesture)
        
        //Notificationの定義、キーボードの表示/非表示の通知の登録
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "showKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "hideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeLoginButton() {
        loginButton.layer.cornerRadius = 3
    }
    
    func makeIconBackGroundView() {
        iconBackGroundView.layer.cornerRadius = iconBackGroundView.frame.width / 2
        iconBackGroundView.layer.borderWidth = 2
        iconBackGroundView.layer.borderColor = UIColor(red: 75/255, green: 199/255, blue: 241/255, alpha: 1).CGColor
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    //キーボードが表示される直前
    func showKeyboard(notification: NSNotification) {
        let keyboardRect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue
        UIView.animateWithDuration(0.25, animations: {
            self.dockViewHeightConstrain.constant = (keyboardRect?.size.height)! + 150
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func hideKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(0.25, animations: {
            self.dockViewHeightConstrain.constant = 290
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func loginPageTapped() {
        self.emailTextField.endEditing(true)
        self.passwordTextField.endEditing(true)
    }
 }

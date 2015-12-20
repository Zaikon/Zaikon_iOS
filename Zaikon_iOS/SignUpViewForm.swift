//
//  SignUpViewForm.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/20.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class SignUpViewForm: UIView {
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var passwordConfirmationLabel: UITextField!
    
    @IBOutlet weak var signUpStartButton: UIButton!
    
    
    class func instance() -> SignUpViewForm {
        
        return UINib(nibName: "SignUpViewForm", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! SignUpViewForm
    }
    
    func setViewEffect() {
        UIView.setGradationView(self)
        signUpStartButton.layer.cornerRadius = 5
    }
    
}

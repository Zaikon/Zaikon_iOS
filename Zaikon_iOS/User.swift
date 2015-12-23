//
//  User.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/19.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class User: NSObject {
    let id: Int?
    var name: String?
    var email: String!
    let password: String!
    let passwordConfirmation: String?
    let autoToken: String?
    
    let ApplicationId = "103518440fd087da8db9cbe85760b54d7b2182bf38d46bf78be3a8aefc0d760c"
    let SecretId = "47ba3a81a7f83ee0fd332b71cbd57bb6f8dc722fd8fc2c737252873b5194b8dd"
    
    init(attribute: JSON) {
        self.id = attribute["id"].int
        self.name = attribute["name"].string
        self.email = attribute["email"].string
        self.password = attribute["password"].string
        self.passwordConfirmation = attribute["password_confirmation"].string
        self.autoToken = attribute["autoToken"].string
    }
    
    
    func signUp(callback: (afterSignUp) -> Void) {
        
        let attribute: [String: AnyObject] = [
            "user": [
                "name": self.name!,
                "email": self.email,
                "password": self.password,
                "password_confirmation": self.passwordConfirmation!,
            ]
        ]
        
        Alamofire.request(.POST, String.getSignUpUrl(), parameters: attribute)
            .responseJSON { response in
                print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
                print(response.result.value)
                print("sign UP")
                
        }
    }
    
    func login(callback: () -> Void) {
        let attribute: [String: AnyObject] = [
            "grant_type": "password", 
            "email": self.email,
            "password": self.password,
            "client_id": ApplicationId,
            "client_secret": SecretId
        ]
        
        Alamofire.request(.POST, String.getTokenUrl(), parameters: attribute)
            .responseJSON { response in
                print(response.result.value!)
        }
    }
}
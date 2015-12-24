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
    var id: Int?
    var name: String?
    var email: String!
    var password: String?
    var passwordConfirmation: String?
    var authToken: String?
    
    let ApplicationId = "103518440fd087da8db9cbe85760b54d7b2182bf38d46bf78be3a8aefc0d760c"
    let SecretId = "47ba3a81a7f83ee0fd332b71cbd57bb6f8dc722fd8fc2c737252873b5194b8dd"
    
    init(attribute: JSON) {
        self.id = attribute["id"].int
        self.name = attribute["name"].string
        self.email = attribute["email"].string
        self.password = attribute["password"].string
        self.passwordConfirmation = attribute["password_confirmation"].string
        self.authToken = attribute["autoToken"].string
    }
    
    func saveUserData(data: JSON, token: String) {
        
        let userData: [String: AnyObject] = [
            "id": data["user"]["id"].int!,
            "name": data["user"]["name"].string!,
            "email": data["user"]["email"].string!,
            "token": token,
        ]
        
        let userDefaluts = NSUserDefaults.standardUserDefaults()
        userDefaluts.setObject(userData, forKey: "userData")
        userDefaluts.synchronize()
    }

    
    
    func signUp(afterSignUp: () -> Void) {
        
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
                print(response.result.value)
                if response.result.value == nil  {
                    // nil == 成功
                    print("サインアップ処理成功")
                    print(response.result.value)
                    afterSignUp()
                    return
                }
                // 失敗しているので、alert返す

        }
    }
    
    func login(afterLogin: () -> Void) {
        let attribute: [String: AnyObject] = [
            "grant_type": "password", 
            "email": self.email,
            "password": self.password!,
            "client_id": ApplicationId,
            "client_secret": SecretId,
        ]
        
        Alamofire.request(.POST, String.getTokenUrl(), parameters: attribute)
            .responseJSON { response in
                guard let token = response.result.value!["access_token"]! else {
                    //取れなかった時
                    print("ログイン失敗")
                    return
                }
                //　取れた時
                print("ログイン処理成功！")
                let headers = ["Authorization": "Bearer \(token)"]
                Alamofire.request(.GET, String.getUserFromToken(), headers: headers)
                    .responseJSON { response in
                        let userData = JSON(response.result.value!)
                        self.saveUserData(userData, token: token as! String)
                }
        }
    }
}
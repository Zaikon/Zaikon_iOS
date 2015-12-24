//
//  CurrentUser.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/23.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import Foundation

class CurrentUser: NSObject {
    
    static let sharedCurrentUser = CurrentUser()
    
    var name: String!
    var id: Int!
    var authToken: String?
    var email: String!

    func hasOauthToken() -> Bool {
        let userDefaluts = NSUserDefaults.standardUserDefaults()
        let userData = userDefaluts.objectForKey("userDate")
        if (userData != nil) &&  (userData!["autoToken"] != nil)
        {
            // set　されている
            name = userData!["name"] as! String
            id = userData!["id"] as! Int
            authToken = userData!["authToken"] as? String
            email = userData!["email"] as? String
            return false
        }
        //　set されていない
        return true

    }
}
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
    var oauthToke: String?

}
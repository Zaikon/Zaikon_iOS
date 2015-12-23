//
//  String+Extensition.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/17.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import Foundation

extension String {
    static func getRootApiUrl() -> String {
        return "http://localhost:3000"
    }
    
    static func getTokenUrl() -> String{
        return "http://localhost:3000/oauth/token"
    }
    
    static func getSignUpUrl() -> String {
        return "http://localhost:3000/api/users"
    }
}
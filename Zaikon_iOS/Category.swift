//
//  Category.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/17.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import Foundation

class Category: NSObject {
    var id: Int!
    var name: String?
    var goods: [Goods] = []
}
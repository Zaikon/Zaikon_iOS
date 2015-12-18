//
//  good.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/17.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import Foundation
import SwiftyJSON

class Goods: NSObject {
    var id: Int?
    var name: String!
    var stockNum: Int!
    var notification_num: Int!
    var image: String?
    var amazon_url: String?
    var category_id: Int!
    var countingType: String!
    
    
    class func createArrayFromJson(arrayJson: JSON) -> Array<Goods> {
        var goodsArray: [Goods] = []
        arrayJson.forEach({ (_, json) in
            let goods = Goods(attribute: json)
            goodsArray.append(goods)
        })
        return goodsArray
    }
    
    init(attribute: JSON) {
        self.id = attribute["id"].int
        self.name = attribute["name"].string
        self.stockNum = attribute["stock_num"].int
        self.notification_num = attribute["notification_num"].int
        self.amazon_url = attribute["amazon_url"].string
        self.image = attribute["image"].string
        self.category_id = attribute["category_id"].int
        self.countingType = attribute["counting_type"].string
    }
}
//
//  good.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/17.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Goods: NSObject {
    var id: Int!
    var name: String!
    var stockNum: Int!
    var notificationNum: Int!
    var image: String?
    var amazon_url: String?
    var category_id: Int!
    var countingType: String!
    
    var categoryStocks = CategoryStocks.sharedInstance
    
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
        self.notificationNum = attribute["notification_num"].int
        self.amazon_url = attribute["amazon_url"].string
        self.image = attribute["image"].string
        self.category_id = attribute["category_id"].int
        self.countingType = attribute["counting_type"].string
    }
    
    func countUp(callback: (goods: Goods) -> Void ) {
        Alamofire.request(.PUT, String.getRootApiUrl() + "/api/goods/\(self.id)/count_up")
            .responseJSON { response in
                guard let object = response.result.value else {
                    print("check host server statred")
                    return
                }
                let goods = Goods(attribute: JSON(object))
                callback(goods: goods)
        }
    }
    
    func countDown(callback: (goods: Goods) -> Void ) {
        Alamofire.request(.PUT, String.getRootApiUrl() + "/api/goods/\(self.id)/count_down")
            .responseJSON { response in
                guard let object = response.result.value else {
                    print("check host server statred")
                    return
                }
                let goods = Goods(attribute: JSON(object))
                callback(goods: goods) 
        }
        
    }
}
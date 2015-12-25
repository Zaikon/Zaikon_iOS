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
    var amazonUrl: String?
    var category_id: Int!
    var countingType: String!
    
    var categoryStocks = CategoryStocks.sharedCategory
    
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
        self.amazonUrl = attribute["amazon_url"].string
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
    
    func update(afterUpdate: (goods: Goods) -> Void ) {
        let attributes: [String: AnyObject] = [
            "id": self.id,
            "name": self.name,
            "stock_num": self.stockNum,
            "notification_num": self.notificationNum,
            "category_id": self.category_id,
            "counting_type": self.countingType,
        ]
        
        Alamofire.request(.PUT, String.getRootApiUrl() + "/api/goods/\(self.id)", parameters: attributes)
            .responseJSON { response in
                guard let object = response.result.value else {
                    print("check host server statred")
                    return
                }
                let goods = Goods(attribute: JSON(object))
                afterUpdate(goods: goods)
        }
    }
}
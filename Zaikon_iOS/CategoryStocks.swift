//
//  CategoryStocks.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/17.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CategoryStocks: NSObject {
    var myCategories: [Category] = []
    static let sharedInstance = CategoryStocks()
    
    func fetchCategories(callback: () -> Void ) {
        Alamofire.request(.GET, String.getRootApiUrl() + "/api/categories")
            .responseJSON { response in
                guard let object = response.result.value else {
                    print("check host server statred")
                    return
                }
                let categoriesJSON = JSON(object)
                categoriesJSON["categories"].forEach { (_, json) in
                    let category = Category()
                    category.id = json["id"].int
                    category.name = json["name"].string
                    category.goods = Goods.createArrayFromJson(json["goods"])
                    CategoryStocks.sharedInstance.myCategories.append(category)
                }
                callback()
        }
    }
}

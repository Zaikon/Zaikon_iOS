//
//  GoodsEditView.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/25.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsEditView: UIView {

    class func instance() -> GoodsEditView {
        return UINib(nibName: "GoodsEditView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! GoodsEditView
    }
}

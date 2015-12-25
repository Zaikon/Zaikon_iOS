//
//  GoodsDetailView.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/18.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsDetailView: UIView {
    @IBOutlet weak var goodsImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stockNumLabel: UILabel!
    @IBOutlet weak var notificationNumLabel: UILabel!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    
    var goods: Goods!
    
    class func instance() -> GoodsDetailView {
        return UINib(nibName: "GoodsDetailView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! GoodsDetailView
    }
    
    override func awakeFromNib() {
        plusBtn.addTarget(self, action: "plusBtnTapped:", forControlEvents: .TouchUpInside)
        minusBtn.addTarget(self, action: "minusBtnTapped:", forControlEvents: .TouchUpInside)
    }
    
    func addBorderEffect() {
        bringPartsEffect(titleLabel, color: UIColor.lightGrey(), cornerRadius: 0)
        bringPartsEffect(stockNumLabel, color: UIColor.lightGrey(), cornerRadius: 0)
        bringPartsEffect(notificationNumLabel, color: UIColor.lightGrey(), cornerRadius: 0)
        bringPartsEffect(minusBtn, color: UIColor.lightGrey(), cornerRadius: 0)
        bringPartsEffect(plusBtn, color: UIColor.lightGrey(), cornerRadius: 0)
    }
    
    func bringPartsEffect(parts: AnyObject, color: UIColor, cornerRadius: CGFloat) {
        parts.layer.borderColor = color.CGColor
        parts.layer.borderWidth = 1
        parts.layer.cornerRadius = cornerRadius
    }
    
    
    func insertGoodsInftormation(goods: Goods) {
        goodsImageView.image = UIImage.diplayImageView(goods.image!)
        titleLabel.text = goods.name
        stockNumLabel.text = "\(goods.stockNum) \(goods.countingType)"
        notificationNumLabel.text = "通知在庫数: \(goods.notificationNum)"
    }
    
    func plusBtnTapped(sender: UIButton) {
        goods.countUp { (goods) -> Void in
            self.stockNumLabel.text = "\(goods.stockNum) \(goods.countingType)"
        }
    }
    
    func minusBtnTapped(sender: UIButton) {
        goods.countDown { (goods) -> Void in
            self.stockNumLabel.text = "\(goods.stockNum) \(goods.countingType)"
        }
    }
    
}

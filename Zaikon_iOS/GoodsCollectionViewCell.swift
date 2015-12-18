//
//  CustomCell.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/07.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {
    var stockNum:Int?
    let goodsImageView = UIImageView()
    let plusButton = UIButton()
    let minusButton = UIButton()
    let unitLabel = UILabel()
    let goodsNumberLabel = UILabel()

    let plusBtnColor = UIColor(red: 236/255, green: 0, blue: 20/255, alpha: 1)
    let minusBtnColor = UIColor(red: 65/255, green: 187/255, blue: 237/255, alpha: 1)
    let btnFont = UIFont(name: "HelveticaNeue", size: 40)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCellView()
        makeBtn(plusButton, title: "+", titleColor: plusBtnColor, x: 7)
        makeBtn(minusButton, title: "−", titleColor: minusBtnColor,  x: 1)
        makeUnitLabel()
        makeGoodNumberLabel()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    
    func makeCellView() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGrey().CGColor
    }
    
    func makeBtn(button: UIButton, title:String, titleColor: UIColor,x: CGFloat) {
        let length = self.frame.width * 1 / 4
        let pointX = self.frame.width * x / 8
        let pointY = self.frame.height * 9 / 10
        
        button.frame.size = CGSizeMake(length, length)
        button.center = CGPointMake(pointX, pointY)
        button.layer.borderColor = UIColor.lightGrey().CGColor
        button.layer.borderWidth = 1
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(titleColor, forState: .Normal)
        button.setTitleColor(UIColor.lightGrey(), forState: .Selected)
        button.titleLabel?.font = btnFont
        self.addSubview(button)
    }
    
    func makeGoodNumberLabel() {
        let length = self.frame.height * 1 / 4
        let pointX = self.frame.width * 1 / 2 - 3
        let pointY = self.frame.height * 9 / 10
        
        goodsNumberLabel.frame.size = CGSizeMake(length, length)
        goodsNumberLabel.center = CGPointMake(pointX, pointY)
        goodsNumberLabel.textAlignment = NSTextAlignment.Center
        goodsNumberLabel.textColor = UIColor.blackColor()
        goodsNumberLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        self.addSubview(goodsNumberLabel)
    }
    
    func makeUnitLabel() {
        let length = self.frame.width * 1 / 2
        let pointX = self.frame.width *  1 / 2  +  20
        let pointY = self.frame.height * 9 / 10 + 5
        
        unitLabel.frame.size = CGSizeMake(length, length)
        unitLabel.center = CGPointMake(pointX, pointY)
        unitLabel.textAlignment = NSTextAlignment.Center
        unitLabel.textColor = UIColor.blackColor()
        unitLabel.font = UIFont(name: "Helvetica-Bold", size: 10)
        self.addSubview(unitLabel)
    }
}

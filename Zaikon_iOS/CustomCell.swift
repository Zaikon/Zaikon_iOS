//
//  CustomCell.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/07.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    var goodNumber = 0;
    let goodsImageView = UIImageView()
    let plusButton = UIButton()
    let minusButton = UIButton()
    let commnetLabel = UILabel()
    let unitLabel = UILabel()
    let goodsNumberLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCellView()
        makePlusButton()
        makeMinusButton()
        setLabel(commnetLabel, text: "あと", x: -25)
        setLabel(unitLabel, text: "本", x: +25)
        setGoodNumberLabel()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    
    func makeCellView() {
        self.backgroundColor = UIColor(red: 240/255, green: 250/255, blue: 255/255, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1).CGColor
    }
    
    func makePlusButton() {
        let length = self.frame.width * 1 / 4
        let pointX = self.frame.width * 1 / 8
        let pointY = self.frame.height * 9 / 10
        
        plusButton.frame.size = CGSizeMake(length, length)
        plusButton.center = CGPointMake(pointX, pointY)
        plusButton.setTitle("+", forState: .Normal)
        plusButton.setTitleColor(UIColor(red: 65/255, green: 187/255, blue: 237/255, alpha: 1), forState: .Normal)
        plusButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 40)
        self.addSubview(plusButton)
    }
    
    func makeMinusButton() {
        let length = self.frame.width * 1 / 4
        let pointX = self.frame.width * 3 / 8
        let pointY = self.frame.height * 9 / 10
        
        minusButton.frame.size = CGSizeMake(length, length)
        minusButton.center = CGPointMake(pointX, pointY)
        minusButton.setTitle("−", forState: .Normal)
        minusButton.setTitleColor(UIColor(red: 236/255, green: 0/255, blue: 12/255, alpha: 1), forState: .Normal)
        minusButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 40)
        self.addSubview(minusButton)
    }
    
    func setGoodNumberLabel() {
        let length = self.frame.height * 1 / 4
        let pointX = self.frame.width * 3 / 4
        let pointY = self.frame.height * 9 / 10
        
        goodsNumberLabel.frame.size = CGSizeMake(length, length)
        goodsNumberLabel.center = CGPointMake(pointX, pointY)
        goodsNumberLabel.text = "10"
        goodsNumberLabel.textAlignment = NSTextAlignment.Center
        goodsNumberLabel.textColor = UIColor.blackColor()
        goodsNumberLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        self.addSubview(goodsNumberLabel)
    }
    
    
    
    func setLabel(label: UILabel, text: String, x: CGFloat) {
        let length = self.frame.width * 1 / 4
        let pointX = self.frame.width *  3 / 4  +  x
        let pointY = self.frame.height * 9 / 10 + 10
        
        label.frame.size = CGSizeMake(length, length)
        label.center = CGPointMake(pointX, pointY)
        label.text = text
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.blackColor()
        label.font = UIFont(name: "Helvetica-Bold", size: 10)
        self.addSubview(label)
    }

}

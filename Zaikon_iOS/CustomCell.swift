//
//  CustomCell.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/07.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var goodImage: UIImageView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var goodNumberLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    var goodNumber = 0;

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.whiteColor()
        setPlusButton()
        setMinusButton()
        // Initialization code
    }
    
    func setPlusButton() {
        plusButton.setTitle("+", forState: UIControlState.Normal)
        plusButton.setTitleColor(UIColor(red: 65/255, green: 187/255, blue: 237/255, alpha: 1), forState: UIControlState.Normal)
        plusButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 50)
    }
    
    func setMinusButton() {
        plusButton.setTitle("−", forState: UIControlState.Normal)
        plusButton.setTitleColor(UIColor(red: 236/255, green: 0/255, blue: 12/255, alpha: 1), forState: UIControlState.Normal)
        plusButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 50)
    }
    
    func setGoodNumberLabel() {
        
    }
    
    func setUnitLabel() {
    }

}

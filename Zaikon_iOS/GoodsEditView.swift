//
//  GoodsEditView.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/25.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsEditView: UIView,  UITextFieldDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var stockNumTextField: UITextField!
    @IBOutlet weak var notificationNumTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var titleBackgound: UIView!
    @IBOutlet weak var basicInfoBackground: UIView!
    
    var goods: Goods!
    var numArray:[Int] = ([Int])(1...100)

    class func instance() -> GoodsEditView {
        return UINib(nibName: "GoodsEditView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! GoodsEditView
    }
    
    override func drawRect(rect: CGRect) {
        setGoodsAttributes()
        makeViewToBeRounded()
        underlineTextField()
    }
    
    func setGoodsAttributes() {
        //　値のset
    }
    
    func makeViewToBeRounded() {
        updateButton.layer.cornerRadius = 5
        titleBackgound.layer.cornerRadius = 5
        basicInfoBackground.layer.cornerRadius = 5
    }
    
    func underlineTextField() {
        let textFieldArray: [UITextField] = [
            nameTextField, unitTextField,stockNumTextField,notificationNumTextField,categoryTextField
        ]
        for textField in textFieldArray {
            CALayer.borderlineTextfield(textField)
        }
    }
}

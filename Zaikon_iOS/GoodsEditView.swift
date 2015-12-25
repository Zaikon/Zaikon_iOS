//
//  GoodsEditView.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/25.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsEditView: UIView, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var stockNumTextField: UITextField!
    @IBOutlet weak var notificationNumTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var titleBackgound: UIView!
    @IBOutlet weak var basicInfoBackground: UIView!
    
    @IBOutlet weak var dockViewHeightConstrain: NSLayoutConstraint!
    
    var goods: Goods!
    var categoryDic = [String: AnyObject]()
    
    
    var categoryInstance = CategoryStocks.sharedCategory
    let toolBar = UIToolbar()
    
    class func instance() -> GoodsEditView {
        return UINib(nibName: "GoodsEditView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! GoodsEditView
    }
    
    override func drawRect(rect: CGRect) {
        print(1)
        setGoodsAttributes()
        print(2)
        makeViewToBeRounded()
        print(3)
        underlineTextField()
        print(4)
        makeToolBar()
    }
    
    override func awakeFromNib() {

        let tapGesture = UIGestureRecognizer(target: self, action: "goodsEditViewTapped")
        print(tapGesture)
        self.basicInfoBackground.addGestureRecognizer(tapGesture)
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        categoryTextField.inputView = pickerView
        
        nameTextField.delegate = self
        unitTextField.delegate = self
        stockNumTextField.delegate = self
        notificationNumTextField.delegate = self
        
//        let notificationCenter = NSNotificationCenter.defaultCenter()
//        notificationCenter.addObserver(self, selector: "showKeyBoard:", name: UIKeyboardWillShowNotification, object: nil)
//        notificationCenter.addObserver(self, selector: "hideKeyBoard:", name:UIKeyboardWillHideNotification, object: nil)
    }
    
//    func showKeyBoard(notification: NSNotification) {
//        
//        print("kakusu~~~")
//        let keyboardRect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue
//        UIView.animateWithDuration(0.25, animations: {
//            print(self.dockViewHeightConstrain.constant)
//            print(keyboardRect?.size.height)
//            self.dockViewHeightConstrain.constant = -(keyboardRect?.size.height)!
//            self.layoutIfNeeded()
//            }, completion: nil)
//    }
//    
//    func hideKeyBoard(notification: NSNotification) {
//        
//        UIView.animateWithDuration(0.25, animations: {
//            self.dockViewHeightConstrain.constant = 30
//            self.layoutIfNeeded()
//            }, completion: nil)
//    }
    
    func goodsEditViewTapped() {
        self.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func setGoodsAttributes() {
        //　値のset
        print(1)
        imageView.image = UIImage.diplayImageView(goods.image!)
        print(2)
        nameTextField.text = goods.name
        print(3)
        unitTextField.text = goods.countingType
        print(4)
        stockNumTextField.text = String(goods.stockNum)
        print(5)
        notificationNumTextField.text = String(goods.notificationNum)
        print(6)
        categoryTextField.text = displayCategory()
    }
    
    func updateGoodsAttributes() {
        
        goods.name = nameTextField.text
        goods.countingType = unitTextField.text
        goods.stockNum = Int(stockNumTextField.text!)
        goods.notificationNum = Int(notificationNumTextField.text!)
        goods.category_id = categoryDic["id"] as! Int
        
    }
    
    func makeViewToBeRounded() {
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).CGColor
        imageView.layer.cornerRadius = 5
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
    
    
    // delegate pickerview
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryInstance.myCategories.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryInstance.myCategories[row].name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoryInstance.myCategories[row].name
    }
    
    func displayCategory() -> String {
        print("Hoge")
        for category in categoryInstance.myCategories {
            print("Hoge2")
            if goods.category_id == category.id {
                print("Hoge2")
                print(category.id)
                print(category.name)
                categoryDic["id"] = category.id
                categoryDic["name"] = category.name
            }
        }
        print(categoryDic)
        print(categoryDic["name"])
        return categoryDic["name"] as! String
    }

    
    // toolbar
    func makeToolBar() {
        toolBar.frame = CGRectMake(0, self.frame.size.height / 6, self.frame.size.width, 40)
        toolBar.layer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height - 20)
        toolBar.barStyle = UIBarStyle.Default
        toolBar.tintColor = UIColor.lightBlue()
        
        let toolBarButton = UIBarButtonItem(title: "close", style: .Bordered, target: self, action: "tapCloseButton")
        toolBar.items = [toolBarButton]
        
        categoryTextField.inputAccessoryView = toolBar
    }
    
    func tapCloseButton() {
        categoryTextField.resignFirstResponder()
    }
    
}

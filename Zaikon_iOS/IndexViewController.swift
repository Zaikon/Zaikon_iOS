//
//  ViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/04.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var goodCollectionView: UICollectionView!

    let cellMargin: CGFloat = 5.0
    let lightGreyColor = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 0.5)
    var goodsNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // app title
        self.title = "ザイコン"
        
        //delegate
        self.goodCollectionView.delegate = self
        self.goodCollectionView.dataSource = self
        
        //register class
        goodCollectionView.registerClass(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        // set initial methods
        self.view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        setCollectionView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let lightBlue = UIColor(red: 75/255, green: 199/255, blue: 241/255, alpha: 1)
        self.navigationController!.navigationBar.barTintColor = lightBlue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Chalkduster", size: 25)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setCollectionView() {
        self.goodCollectionView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
    }
    
    
    // collectionView setting
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    //cell size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = self.view.frame.size.width / 2 - 8
        let cellHeight = cellWidth * 5 / 4
        return CGSizeMake(cellWidth, cellHeight)
    }
    
    //vertial gap between cells
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellMargin
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellMargin
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.goodsNumberLabel.text = String(goodsNumber)
        cell.plusButton.addTarget(self, action: "plusBtnTapped:", forControlEvents: .TouchUpInside)
        cell.minusButton.addTarget(self, action: "minusBtnTapped:", forControlEvents: .TouchUpInside)
        makeCustomcellView(cell)
        return cell
     }
    
    func makeCustomcellView(cell: CustomCell) {
        setgoodsImage(cell)
    }
    
    func setgoodsImage(cell: CustomCell) {
        let cellWidth = cell.frame.width
        cell.goodsImageView.frame.size = CGSizeMake(cellWidth, cellWidth)
        cell.goodsImageView.contentMode = UIViewContentMode.ScaleAspectFill
        cell.goodsImageView.clipsToBounds = true
        cell.goodsImageView.image = UIImage(named: "akiko.jpg")
        cell.addSubview(cell.goodsImageView)
    }
    
    //Gesture
    func plusBtnTapped(sender: UIButton) {
        goodsNumber += 1
        goodCollectionView.reloadData()
    }
    
    
    func minusBtnTapped(sender: UIButton) {
        goodsNumber -= 1
        goodCollectionView.reloadData()
    }



}


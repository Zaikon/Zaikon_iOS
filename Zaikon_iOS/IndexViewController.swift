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

    override func viewDidLoad() {
        super.viewDidLoad()
        // app title
        self.title = "ザイコン"
        
        // register xib file
        self.goodCollectionView.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        
        //delegate
        self.goodCollectionView.delegate = self
        self.goodCollectionView.dataSource = self
        
        // set initial methods
        self.view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        setCollectionView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let lightBlue = UIColor(red: 75/256, green: 199/256, blue: 241/256, alpha: 1)
        self.navigationController!.navigationBar.barTintColor = lightBlue
//        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Chalkduster", size: 25)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setCollectionView() {
        self.goodCollectionView.backgroundColor = UIColor(red: 248/256, green: 248/256, blue: 248/256, alpha: 1)
    }
    
    
    // collectoinView setting
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = self.view.frame.size.width/2 - 6
        let cellHeight = cellWidth * 5 / 4
        return CGSizeMake(cellWidth, cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        setgoodImage(cell)
        return cell
     }
    
    func setgoodImage(cell: CustomCell) {
        let cellWidth = self.view.frame.size.width/2 - 6
        cell.goodImage.image = UIImage(named: "in_1507_uminofuta-photo1.jpg")
        cell.goodImage.contentMode = UIViewContentMode.ScaleAspectFill
        cell.goodImage.clipsToBounds = true
        cell.goodImage.frame.size = CGSizeMake(cellWidth, cellWidth)
    }


}


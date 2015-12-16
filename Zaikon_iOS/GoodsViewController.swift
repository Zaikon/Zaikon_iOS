//
//  goodsViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/16.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class GoodsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGoodsCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setGoodsCollectionView() {
        let cellWidth = self.view.frame.size.width / 2 - 2
        
        // collectionView setting
        let frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(cellWidth, cellWidth * 5 / 4)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        let goodsCollectionView = GoodsCollectionView(frame: frame, collectionViewLayout: layout)
        goodsCollectionView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        self.view.addSubview(goodsCollectionView)
    }
}

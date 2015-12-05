//
//  ViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/04.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Zaikon"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let lightBlue = UIColor(red: 75/256, green: 199/256, blue: 241/256, alpha: 1)
        self.navigationController!.navigationBar.barTintColor = lightBlue
        self.navigationItem.title = "Zaikon"
//        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Chalkduster", size: 30)!]        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


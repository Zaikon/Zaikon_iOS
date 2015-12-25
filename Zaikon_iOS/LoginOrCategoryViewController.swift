//
//  LoginOrCategoryViewController.swift
//  Zaikon_iOS
//
//  Created by 三浦立輝 on 2015/12/25.
//  Copyright © 2015年 Tatsuki_Miura. All rights reserved.
//

import UIKit

class LoginOrCategoryViewController: UIViewController {
    let currentUser = CurrentUser.sharedCurrentUser

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if currentUser.hasOauthToken() {
            //　持っている
            self.performSegueWithIdentifier("ShowCategoryViewController", sender: self)
        } else {
            //　持っていない
            self.performSegueWithIdentifier("ShowLoginViewController", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

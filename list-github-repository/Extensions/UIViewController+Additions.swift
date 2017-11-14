//
//  UIView+Additions.swift
//  list-github-repository
//
//  Created by Mateus Marques on 14/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    func startActivityIndicator(numberOfObjects: Int) {
        if numberOfObjects == 0 {
            SVProgressHUD.show(withStatus: "Carregando...")
            SVProgressHUD.setDefaultStyle(.light)
            SVProgressHUD.setDefaultMaskType(.black)
            SVProgressHUD.setForegroundColor(UIColor(red: 14/255, green: 93/255, blue: 149/255, alpha: 1))
            SVProgressHUD.setBackgroundColor(UIColor.white)
        }
    }
    
    func dismissActivityIndicator() {
        SVProgressHUD.dismiss()
    }
}

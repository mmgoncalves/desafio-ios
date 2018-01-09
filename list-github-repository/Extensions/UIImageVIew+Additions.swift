//
//  UIImageVIew+Additions.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Kingfisher

extension UIImageView {
    
    func downloadImage(byString imageName: String?) {
        if let imgString = imageName, let url = URL(string: imgString) {
            self.kf.setImage(with: url)
        }
    }
}


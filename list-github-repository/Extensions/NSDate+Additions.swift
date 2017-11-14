//
//  NSDate+Additions.swift
//  list-github-repository
//
//  Created by Mateus Marques on 14/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

extension NSDate {
    var shortDate: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: self as Date)
    }
}

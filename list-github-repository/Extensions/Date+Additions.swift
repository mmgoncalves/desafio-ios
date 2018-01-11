//
//  Date+Additions.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

extension Date {
    static func from(dateString: String) -> Date? {
        let formatt = DateFormatter()
        formatt.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatt.date(from: dateString)
    }
    
    var shortDate: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: self)
    }
}

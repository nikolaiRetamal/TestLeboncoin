//
//  Date+formatted.swift
//  TestLeboncoin
//
//  Created by Nikolaï RETAMAL on 21/07/2023.
//

import Foundation

extension Date {
    var detailedFormatString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd/MM/yyyy à HH:mm"
        return formatter.string(from: self)
    }
}

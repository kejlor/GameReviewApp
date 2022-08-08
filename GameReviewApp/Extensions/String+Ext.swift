//
//  String+Ext.swift
//  GameReviewApp
//
//  Created by Bartosz Wojtkowiak on 08/08/2022.
//

import Foundation

extension String {
    func asDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.date(from: self)
    }
}

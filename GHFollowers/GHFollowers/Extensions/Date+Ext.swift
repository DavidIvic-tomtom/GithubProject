//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by David on 24.2.25..
//

import Foundation

extension Date{
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}

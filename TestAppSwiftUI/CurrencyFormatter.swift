//
//  CurrencyFormatter.swift
//  TestAppSwiftUI
//
//  Created by Daniel Pitts on 10/4/21.
//

import Foundation

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}

//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Justin on 6/19/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

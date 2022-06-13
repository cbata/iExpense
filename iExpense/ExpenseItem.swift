//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Chris Bata on 6/10/22.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

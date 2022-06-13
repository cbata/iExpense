//
//  Expenses.swift
//  iExpense
//
//  Created by Chris Bata on 6/10/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

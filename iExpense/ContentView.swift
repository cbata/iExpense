//
//  ContentView.swift
//  iExpense
//
//  Created by Chris Bata on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            List {
                ForEach(types, id: \.self) { type in
                Section(type) {
                ForEach(expenses.items.filter { $0.type == type}) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()

                        Text(item.amount, format: .currency(code: "USD"))
                    }
                    .listRowBackground(getListRowBackgroundColor(amount: item.amount))

                }
                .onDelete(perform: removeItems)
                }
            }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        print("offsets: \(offsets)")
//        expenses.items.remove(atOffsets: offsets)
    }

    func getListRowBackgroundColor(amount: Double) -> Color {
        if amount <= 10 {
            return Color.green
        } else if amount <= 20 {
            return Color.yellow
        }
        return Color.red
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

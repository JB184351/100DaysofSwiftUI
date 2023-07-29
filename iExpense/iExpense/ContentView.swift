//
//  ContentView.swift
//  iExpense
//
//  Created by Justin on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    let userRegionCode = Locale.current.currency?.identifier
    @State private var isPersonal = false
    
    var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    
    var businessExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(personalExpenses, id:\.id) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            // Challenge 1 Using different region code based on user's preference
                            // Challenge 2 The text is edited based on the amount
                            Text(item.amount, format: .currency(code: userRegionCode ?? "USD"))
                                .background(item.amount < 10 ? .green : .clear)
                                .foregroundColor(item.amount > 100 ? .red : .black)
                                .fontWidth(item.amount < 100 ? .compressed : .none)
                                .accessibilityLabel("Name of expense is \(item.name) and the amount is \(item.amount)")
                                .accessibilityHint("Personal")
                        }
                    }
                  
                    .onDelete { offsets in
                        isPersonal = true
                        removeItems(at: offsets)
                    }
                } header: {
                    Text("Personal")
                }
                
                Section {
                    ForEach(businessExpenses, id:\.id) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            
                            // Challenge 1 Using different region code based on user's preference
                            // Challenge 2 The text is edited based on the amount
                            Text(item.amount, format: .currency(code: userRegionCode ?? "USD"))
                                .background(item.amount < 10 ? .green : .clear)
                                .foregroundColor(item.amount > 100 ? .red : .black)
                                .fontWidth(item.amount < 100 ? .compressed : .none)
                                .accessibilityLabel("Name of expense is \(item.name) and the amount is \(item.amount)")
                                .accessibility(hint: "Business")
                        }
                    }
                    .onDelete { offsets in
                        isPersonal = false
                        removeItems(at: offsets)
                    }
                } header: {
                    Text("Buisness")
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
    
    // Challenge 3
    // Modified method to remove the item from the items array based on if the
    // expense was personal or not and then comparing uuids
    // to make sure I delete the right one out of all the items.
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            if isPersonal {
                if let index = expenses.items.firstIndex(where: { $0.id == personalExpenses[offset].id } ) {
                    expenses.items.remove(at: index)
                }
            } else {
                if let index = expenses.items.firstIndex(where: { $0.id == businessExpenses[offset].id } ) {
                    expenses.items.remove(at: index)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

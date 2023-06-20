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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id:\.id) { item in
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
                    }
                }
                .onDelete(perform: removeItems(at:))
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
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

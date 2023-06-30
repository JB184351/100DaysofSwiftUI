//
//  ContentView.swift
//  HabitTracker
//
//  Created by Justin on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items, id: \.id) { habit in
                    Section {
                        VStack(alignment: .leading) {
                            Text(habit.title)
                            Spacer()
                            Text(habit.description)
                        }
                    }
                    
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

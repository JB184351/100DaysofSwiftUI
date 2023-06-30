//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Justin on 6/30/23.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var habitName = ""
    @State private var habitDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Title", text: $habitName)
                TextField("Habit Description", text: $habitDescription)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    let habit = Habit(title: habitName, description: habitDescription)
                    habits.items.append(habit)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}

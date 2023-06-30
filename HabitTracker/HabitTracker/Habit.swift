//
//  Habit.swift
//  HabitTracker
//
//  Created by Justin on 6/30/23.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
}

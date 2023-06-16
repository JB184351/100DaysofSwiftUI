//
//  ContentView.swift
//  TimesTables
//
//  Created by Justin on 6/16/23.
//

import SwiftUI

enum QuestionDifficulty: String, CaseIterable, Equatable, Hashable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

struct ContentView: View {
    @State private var timesTablesSelection = 0
    @State private var questionDifficulty: QuestionDifficulty = .easy
    @State private var numberOfQuestions = 5
    let numberOfQuestionsToAnswer = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("", selection: $timesTablesSelection) {
                        ForEach(2..<13) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select Number To Practice Times Tables With")
                }
                
                Section {
                    Picker("", selection: $questionDifficulty) {
                        ForEach(QuestionDifficulty.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                } header: {
                    Text("Select Difficulty of Questions")
                }
                
                Section {
                    Picker("", selection: $numberOfQuestions) {
                        ForEach(numberOfQuestionsToAnswer, id: \.self) { num in
                            Text("\(num)")
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                } header: {
                    Text("Enter the number of questions you would like to answer")
                }
            }
            .navigationTitle("Times Tables")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

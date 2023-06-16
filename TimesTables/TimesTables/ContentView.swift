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
    @State private var numberOfQuestionsCorrect = 0
    @State private var answer = 0
    
    let numberOfQuestionsToAnswer = [5, 10, 20]
    
    @State private var questions: [[Int]] = [[0, 0]]
    
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
                    .onChange(of: timesTablesSelection) { timesTablesSelection in
                        generateQuestions(difficulty: questionDifficulty, numberOfQuestions: numberOfQuestions, multiple: timesTablesSelection)
                    }
                } header: {
                    Text("Select Number To Practice Times Tables With")
                }
                
                Section {
                    Picker("", selection: $questionDifficulty) {
                        ForEach(QuestionDifficulty.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    .onChange(of: questionDifficulty) { questionDifficulty in
                        generateQuestions(difficulty: questionDifficulty, numberOfQuestions: numberOfQuestions, multiple: timesTablesSelection)
                    }
                } header: {
                    Text("Select Difficulty of Questions")
                }
                
                Section {
                    Picker("", selection: $numberOfQuestions) {
                        ForEach(numberOfQuestionsToAnswer, id: \.self) { num in
                            Text("\(num)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    .onChange(of: numberOfQuestions) { numberOfQuestions in
                        generateQuestions(difficulty: questionDifficulty, numberOfQuestions: numberOfQuestions, multiple: timesTablesSelection)
                    }
                } header: {
                    Text("Enter the number of questions you would like to answer")
                }
                
                List {
                    ForEach(questions, id: \.self) {
                        Text("\($0[0]) x \($0[1])")
                    }
                }
            }
            .navigationTitle("Times Tables")
        }
    }
    
    func generateQuestions(difficulty: QuestionDifficulty, numberOfQuestions: Int, multiple: Int) {
        var easyDifficulty = Array([[2, 2], [3, 2], [2, 3], [4, 2], [2, 4], [3, 3], [4, 3], [4, 4], [4, 5], [3, 5], [2, 5], [5, 5], [6, 2], [7, 2], [8, 2], [9, 2], [10, 2], [11, 2], [12, 2], [2, 12], [2, 11], [2, 10], [2, 9], [2, 8], [2, 7], [5, 3]].filter { subArray in
            subArray.contains(2)
        }.shuffled())
        
        easyDifficulty = Array(easyDifficulty.prefix(numberOfQuestions))
                                   
        let mediumDifficulty = Array([[5, 6], [5, 7], [5, 8], [5, 9], [5, 10], [5, 11], [5, 12], [6, 6], [6, 7], [6, 8], [6, 9], [6, 10], [6, 11], [6, 12], [7, 7], [7, 8], [7, 9], [7, 10], [7, 11], [7, 12], [8, 8]].shuffled().prefix(numberOfQuestions))
        
        let hardDifficulty = Array([[12, 2], [3, 11], [12, 11], [4, 12], [12, 5], [11, 4], [9, 8], [12, 9], [9, 10], [10, 12], [11, 10]].shuffled().prefix(numberOfQuestions))
        
        print(easyDifficulty)
        
        switch difficulty {
        case .easy:
            questions = easyDifficulty
        case .medium:
            questions = mediumDifficulty
        case .hard:
            questions = hardDifficulty
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

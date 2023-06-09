import SwiftUI

enum QuestionDifficulty: String, CaseIterable, Equatable, Hashable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

struct ContentView: View {
    @State private var timesTablesSelection = 2
    @State private var questionDifficulty: QuestionDifficulty = .easy
    @State private var numberOfQuestions = 5
    @State private var numberOfQuestionsCorrect = 0
    @State private var answers: [(answer: String, isCorrect: Bool)] = Array(repeating: ("", false), count: 5)

    let numberOfQuestionsToAnswer = [5, 10, 20]
    let timesTables = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    @State private var questions: [[Int]] = [[0, 0]]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("", selection: $timesTablesSelection) {
                        ForEach(timesTables, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .onAppear() {
                        generateQuestions(difficulty: questionDifficulty, numberOfQuestions: numberOfQuestions, multiple: timesTablesSelection)
                    }
                    .onChange(of: timesTablesSelection) { newValue in
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
                    ForEach(questions.indices, id: \.self) { index in
                        let questionText = "\(questions[index][0]) x \(questions[index][1])"
                        Text(questionText)
                        TextField("", text: $answers[index].answer)
                            .keyboardType(.numberPad)
                            .labelsHidden()
                            .onChange(of: answers[index].answer) { answer in
                                checkAnswer(num1: questions[index][0], num2: questions[index][1], answer: answer, index: index)
                            }
                        Text(answers[index].isCorrect ? "Correct!" : "Incorrect!")
                            .font(.headline)
                            .foregroundColor(answers[index].isCorrect ? .green : .red)
                    }
                }
                
                Button("Refresh") {
                    generateQuestions(difficulty: questionDifficulty, numberOfQuestions: numberOfQuestions, multiple: timesTablesSelection)
                }
            }
            .navigationTitle("Times Tables")
        }
    }

    func generateQuestions(difficulty: QuestionDifficulty, numberOfQuestions: Int, multiple: Int) {
        var easyDifficulty = Array([[2, 2], [3, 2], [2, 3], [4, 2], [2, 4], [3, 3], [4, 3], [4, 4], [4, 5], [3, 5], [2, 5], [5, 5], [6, 2], [7, 2], [8, 2], [9, 2], [10, 2], [11, 2], [12, 2], [2, 12], [2, 11], [2, 10], [2, 9], [2, 8], [2, 7], [5, 3]].filter { subArray in
            subArray.contains(multiple)
        }.shuffled())

        easyDifficulty = Array(easyDifficulty.prefix(numberOfQuestions))

        var mediumDifficulty = Array([[5, 6], [5, 7], [5, 8], [5, 9], [5, 10], [5, 11], [5, 12], [6, 6], [6, 7], [6, 8], [6, 9], [6, 10], [6, 11], [6, 12], [7, 7], [7, 8], [7, 9], [7, 10], [7, 11], [7, 12], [8, 8]].filter { subArray in
            subArray.contains(multiple)
        }.shuffled())

        mediumDifficulty = Array(easyDifficulty.prefix(numberOfQuestions))

        var hardDifficulty = Array([[12, 2], [3, 11], [12, 11], [4, 12], [12, 5], [11, 4], [9, 8], [12, 9], [9, 10], [10, 12], [11, 10]].filter { subArray in
            subArray.contains(multiple)
        }.shuffled())

        hardDifficulty = Array(easyDifficulty.prefix(numberOfQuestions))

        answers = Array(repeating: ("", false), count: numberOfQuestions)

        print(difficulty.rawValue)
        
        switch difficulty {
        case .easy:
            questions = easyDifficulty
        case .medium:
            questions = mediumDifficulty
        case .hard:
            questions = hardDifficulty
        }
    }

    private func checkAnswer(num1: Int, num2: Int, answer: String, index: Int) {
        let userAnswer = Int(answer) ?? 0

        if userAnswer == (num1 * num2) {
            answers[index].isCorrect = true
        } else {
            answers[index].isCorrect = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

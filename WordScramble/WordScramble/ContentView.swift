//
//  ContentView.swift
//  WordScramble
//
//  Created by Justin on 6/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement()
                        .accessibilityLabel("\(word), \(word.count) letters")
                        
                    }
                }
                
                Section {
                    Text("Score is \(score)")
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            } // Challenge 2: Add a toolbar that starts a new game
            .toolbar {
                Button("Start Game") {
                    startGame()
                    score = 0
                    usedWords.removeAll()
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word use already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "you can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up you know!")
            return
        }
        
        // Challenge 1
        guard isStartingWord(startingWord: rootWord, answer: answer) else {
            wordError(title: "Don't use the starting word", message: "Use a word that is based off the starting word!")
            return
        }
        
        guard isShorterThanThreeLetters(word: answer) else {
            wordError(title: "Word is shorter than 3 letters!", message: "Come up with longer words!")
            return
        }
        
        addToScore(word: answer)
        
        withAnimation {
            usedWords.insert(answer, at: 0) 
        }
       
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func isStartingWord(startingWord: String, answer: String) -> Bool {
        return startingWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) != answer
    }
    
    func isShorterThanThreeLetters(word: String) -> Bool {
        return word.count > 3
    }
    
    // Challenge 3
    // Decicded to make the scoring based on how many
    // letters you are able to use in a single word
    func addToScore(word: String) {
        switch word.count {
        case 3...4:
            score += 1
        case 5...6:
            score += 2
        case 7:
            score += 3
        case 8:
            score += 5
        default:
            score += 0
        }
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Justin on 6/5/23.
//

import SwiftUI

enum RockPaperScissors: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

struct ContentView: View {
    let rockPaperScissors: [RockPaperScissors] = RockPaperScissors.allCases
    @State private var computerChoice: RockPaperScissors = .rock
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text("The computer chose \(computerChoice.rawValue)")
            Text(gameplayText())
            Text("Current score is \(playerScore)")
            
            HStack {
                ForEach(rockPaperScissors, id: \.rawValue) { button in
                    Button(button.rawValue, action: {
                        if shouldWin == determineWinner(playerChoice: RockPaperScissors(rawValue: button.rawValue) ?? .paper, computerChoice: computerChoice) {
                            playerScore += 1
                        } else {
                            playerScore -= 1
                        }
                        shouldWin.toggle()
                        computerChoice = rockPaperScissors.randomElement()!
                    })
                    .padding(10)
                    .foregroundColor(.black)
                    .background(.blue)
                    .cornerRadius(5)
                }
            }
        }
    }
    
    func determineWinner(playerChoice: RockPaperScissors, computerChoice: RockPaperScissors) -> Bool {
        if playerChoice == .paper && computerChoice == .rock {
            return true
        } else if playerChoice == .rock && computerChoice == .scissors {
            return true
        } else if playerChoice == .scissors && computerChoice == .paper {
            return true
        } else {
            return false
        }
    }
    
    func gameplayText() -> String {
        switch shouldWin {
        case true:
            return "The player must win against the computer"
        case false:
            return "The player must select the losing option"
        }
    }
    
    func addToScore(playerChoice: RockPaperScissors, computerChoice: RockPaperScissors) {
        if shouldWin == determineWinner(playerChoice: playerChoice, computerChoice: computerChoice) {
            playerScore += 1
        } else {
            playerScore -= 1
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

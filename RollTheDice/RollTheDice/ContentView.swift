//
//  ContentView.swift
//  RollTheDice
//
//  Created by Justin on 8/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedNumberSidedDie = 6
    @State private var rollResult = 1
    
    let allPossibleSides = [4, 6, 8, 10, 12, 20, 100]
    
    var dice: [Int] {
        switch selectedNumberSidedDie {
        case 4:
            return Array(1...4)
        case 6:
            return Array(1...6)
        case 8:
            return Array(1...8)
        case 10:
            return Array(1...10)
        case 12:
            return Array(1...12)
        case 20:
            return Array(1...20)
        case 100:
            return Array(1...100)
        default:
            return Array(1...6)
        }
    }
    
    var body: some View {
        Form {
            Picker("Select the number of sided die you would like to roll", selection: $selectedNumberSidedDie) {
                ForEach(allPossibleSides, id: \.self) { side in
                    Text("\(side)").tag(side)
                }
            }
            
            HStack {
                Button("Roll the Dice") {
                    rollResult = rollTheDice(dice: dice)
                }
                
                Spacer()
                
                Text("Rolled a \(rollResult)")
            }
        }
    }
    
    private func rollTheDice(dice: [Int]) -> Int {
        return dice.randomElement()!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

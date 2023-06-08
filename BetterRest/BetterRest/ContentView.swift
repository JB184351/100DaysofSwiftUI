//
//  ContentView.swift
//  BetterRest
//
//  Created by Justin on 6/6/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var showingAlert = false
    
    // Challenge 3
    // Changed calculate bedtime so it returns a date
    // and use that to make a computed String property
    // to display whenever the user changes any of the
    // parameters that determines what time the user
    // should go to bed
    private var bedTimeMessage: String {
        guard let sleepTime = calculateBedTime() else { return "Error" }
        let bedTime = sleepTime.formatted(date: .omitted, time: .shortened)
        
        return "The ideal bedtime is... \(bedTime)"
     }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 6
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Challenge 1: Turn all VStacks into Sections
                // I kinda liked VStacks better but the Section
                // makes each part of the UI separate which I think is appropriate here
                Section {
                    Text("When do you want ot wake up ?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents:
                            .hourAndMinute)
                    .labelsHidden()
                }
                
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    // Challenge 2 Change Stepper to Picker
                    Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                        ForEach(1...20, id:\.self) {
                            Text($0, format: .number)
                        }
                    }
                    
                }
                
                Text(bedTimeMessage)
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedTime() -> Date? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

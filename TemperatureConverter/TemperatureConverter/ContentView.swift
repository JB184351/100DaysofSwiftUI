//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Justin on 5/29/23.
//

import SwiftUI

enum Temp: String, CaseIterable {
    case fahrenheit = "Fahrenheit"
    case celsius = "Celsius"
    case kelvin = "Kelvin"
    
    var tempatureType: String {
        switch self {
        case .fahrenheit:
            return "Fahrenheit"
        case .celsius:
            return "Celsius"
        case .kelvin:
            return "Kelvin"
        }
    }
}

struct ContentView: View {
    @State var currentTemp = 0.0
    @FocusState private var inputIsFocused: Bool
    @State var convertedTempSelection: String = Temp.fahrenheit.tempatureType
    
    var convertedTemp = 0.0
    let temps: [Temp] = [.fahrenheit, .celsius, .kelvin]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Temperature", value: $currentTemp, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Enter temperature in celsius")
                }
                
                Section {
                    Picker("Tempature Selection", selection: $convertedTempSelection) {
                        ForEach(Temp.allCases, id: \.self) { tempType in
//                            Text($0.rawValue, format: .number)
                        }
                    }
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

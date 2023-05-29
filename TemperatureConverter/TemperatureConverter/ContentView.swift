//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Justin on 5/29/23.
//

import SwiftUI

enum Temp: String, CaseIterable, Equatable, Hashable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
}

struct ContentView: View {
    @FocusState private var inputIsFocused: Bool
    @State private var convertedTempSelection: Temp = .celsius
    @State private var currentTemp = 0.0
    
    private var convertedTemp: Double {
        let inputTemp = Measurement(value: currentTemp, unit: UnitTemperature.celsius)
        
        switch convertedTempSelection {
        case .celsius:
            return inputTemp.value
        case .fahrenheit:
            return inputTemp.converted(to: .fahrenheit).value
        case .kelvin:
            return inputTemp.converted(to: .kelvin).value
        }
    }
    
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
                        ForEach(Temp.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Select tempature type to convert to")
                }
                
                Section {
                    Text("The tempature in \(convertedTempSelection.rawValue) is \(convertedTemp, specifier: "%.2f") degrees")
                    
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

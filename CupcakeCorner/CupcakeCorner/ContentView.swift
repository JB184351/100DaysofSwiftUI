//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Justin on 7/3/23.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var orderObject: OrderObject
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderObject.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(orderObject.order.quantity)", value: $orderObject.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $orderObject.order.specialRequestEnabled.animation())
                    
                    if orderObject.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $orderObject.order.extraFrosting)
                        Toggle("Add extra frosting", isOn: $orderObject.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(orderObject: orderObject)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(orderObject: OrderObject(order: Order()))
    }
}

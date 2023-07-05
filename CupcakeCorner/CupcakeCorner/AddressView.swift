//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Justin on 7/3/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderObject: OrderObject
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderObject.order.name)
                TextField("Street Address", text: $orderObject.order.streetAddress)
                TextField("City", text: $orderObject.order.city)
                TextField("Zip", text: $orderObject.order.zip)
                    .keyboardType(.numberPad)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderObject: orderObject)
                } label: {
                    Text("Check out")
                }
                .disabled(orderObject.order.hasValidAddress == false)
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(orderObject: OrderObject(order: Order()))
    }
}

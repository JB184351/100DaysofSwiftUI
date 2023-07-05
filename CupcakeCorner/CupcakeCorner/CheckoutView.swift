//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Justin on 7/3/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMesssage = ""
    @State private var showingConfirmationMessage = false
    @State private var showFailedAlertMessage = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
                // Challenge 2 Present Alert Message When Placing An Order Fails
                .alert("Error!" ,isPresented: $showFailedAlertMessage) {
                    Button("OK") {}
                } message: {
                    Text("Failed to place the order, please try again later.")
                }
            }
        }
        .navigationBarTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmationMessage) {
            Button("OK") {}
        } message: {
            Text(confirmationMesssage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            print("Not a valid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMesssage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmationMessage = true
            
        } catch {
            print("Order failed to send")
            showFailedAlertMessage = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

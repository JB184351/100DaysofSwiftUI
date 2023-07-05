//
//  CupcakeCornerApp.swift
//  CupcakeCorner
//
//  Created by Justin on 7/3/23.
//

import SwiftUI

@main
struct CupcakeCornerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(orderObject: OrderObject(order: Order()))
        }
    }
}

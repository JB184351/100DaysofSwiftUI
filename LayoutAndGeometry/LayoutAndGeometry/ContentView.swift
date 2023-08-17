//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Justin on 8/17/23.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            // Challenge 1, I think? It does disappear??
//                            .opacity(geo.frame(in: .global).minY <= 150 ? 0 : 1)
                        // Challenge 2
                            .scaleEffect(geo.frame(in: .global).minY <= 150 ? 0.5 : 1)
                            .scaleEffect(geo.frame(in: .global).minY >= 700 ? 2.0 : 1)
                    }
                    .frame(height: 40)
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

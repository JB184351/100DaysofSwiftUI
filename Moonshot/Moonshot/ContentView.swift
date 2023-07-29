//
//  ContentView.swift
//  Moonshot
//
//  Created by Justin on 6/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isGrid = true
    
    // Challenge 3
    var body: some View {
        NavigationView {
            Group {
                if isGrid {
                    MoonShotGridView()
                } else {
                    MoonShotListView()
                }
            }
            .toolbar {
                Button() {
                    isGrid.toggle()
                } label: {
                    if isGrid {
                        Image(systemName: "list.bullet")
                            .accessibilityLabel("Change to List View")
                    } else {
                        Image(systemName: "circle.grid.2x2")
                            .accessibilityLabel("Change to Grid View")
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Justin on 8/17/23.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    @State private var scrollOffset = 0.0
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                colors[index % 7]
                                    .hueRotation(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5)
                                    .saturation(0.3 + scrollOffset)
                                    .brightness(0.5 + scrollOffset)
                            )
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            // Challenge 1, I think? It does disappear??
                            .opacity(geo.frame(in: .global).minY <= 150 ? 0 : 1)
                            // Challenge 2, change the scale based on the position of the view
                            .scaleEffect(geo.frame(in: .global).minY <= 200 ? 0.5 : 1)
                            .scaleEffect(geo.frame(in: .global).minY >= 700 ? 2.0 : 1)
                            .onOffsetChange { offset in
                                scrollOffset = offset.y
                            }
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

// Challenge 3, used chatGPt to help with this
// though I don't think it worked well but was
// interested to look at
struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}

extension View {
    func onOffsetChange(_ handler: @escaping (CGPoint) -> Void) -> some View {
        background(GeometryReader { proxy in
            Color.clear
                .preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .global).origin
                )
        })
        .onPreferenceChange(OffsetPreferenceKey.self) { preferences in
            handler(preferences)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

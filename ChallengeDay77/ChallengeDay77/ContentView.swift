//
//  ContentView.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    @State private var addPersonPicker = false
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.people) { person in
                        Section {
                            HStack {
                                image?
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                
                                Text(person.name)
                            }
                            .onAppear {
                                loadImage(person: person)
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        addPersonPicker = true
                    } label : {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $addPersonPicker) {
                AddPersonView()
            }
        }
    }
    
    func loadImage(person: Person) {
        image = person.getImage(from: person.image)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

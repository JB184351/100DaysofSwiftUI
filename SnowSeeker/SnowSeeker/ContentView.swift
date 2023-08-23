//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Justin on 8/19/23.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

// For Challenge 3: Adding the filter types based on
// what the user could want.
enum FilterTypes {
    case defaultOrder, alphabetical, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    @State private var filterType: FilterTypes = .defaultOrder
    @State private var isShowingFilterDialog = false
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    isShowingFilterDialog = true
                } label: {
                    Label("Sort", systemImage: "folder")
                }
            }
            .confirmationDialog("Sort Options", isPresented: $isShowingFilterDialog) {
                Button("Default") { filterType = .defaultOrder }
                Button("Alphabetical") { filterType = .alphabetical }
                Button("Country") { filterType = .country }
            }
            
            WelcomeView()
        }
        .phoneOnlyNavigationView()
        .environmentObject(favorites)
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            switch filterType {
            case .defaultOrder:
                return resorts
            case .alphabetical:
                return resorts.sorted(by: { $0.name < $1.name })
            case .country:
                return resorts.sorted(by: { $0.country < $1.country })
            }
        } else {
            return resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

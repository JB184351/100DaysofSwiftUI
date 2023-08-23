//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Justin on 8/22/23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from our set, updates all views, and saves the change
     func remove(_ resort: Resort) {
         objectWillChange.send()
         resorts.remove(resort.id)
         save()
     }

     func save() {
         // write out our data
     }
}

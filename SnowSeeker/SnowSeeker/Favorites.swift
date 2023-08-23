//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Justin on 8/22/23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Favorites")
    
    // Challenge 2: Filled in loading and saving methods
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            resorts = try JSONDecoder().decode(Set<String>.self, from: data)
        } catch {
            resorts = []
        }
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
         do {
             let data = try JSONEncoder().encode(resorts)
             try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
         } catch {
             print("Unable to save data.")
         }
     }
}

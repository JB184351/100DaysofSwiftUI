//
//  AddPersonView-ViewModel.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import SwiftUI

@MainActor class ViewModel: ObservableObject {
    @Published private(set) var people: [Person]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("People")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            people = []
        }
    }
    
    func addPerson(name: String, image: UIImage?, latitude: Double, longitude: Double) {
        guard let imageData = image?.jpegData(compressionQuality: 0.8) else { return }
        let newPerson = Person(id: UUID(), name: name, image: imageData, latitude: latitude, longitude: longitude)
        people.append(newPerson)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

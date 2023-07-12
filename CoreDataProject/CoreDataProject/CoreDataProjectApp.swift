//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Justin on 7/10/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) 
        }
    }
}

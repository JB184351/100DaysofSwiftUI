//
//  Person.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import Foundation
import UIKit
import SwiftUI

struct Person: Codable, Identifiable, Equatable {
    var id: UUID
    let name: String
    let image: Data
    
    func getImage(from data: Data) -> Image {
        if let image = UIImage(data: data) {
            return Image(uiImage: image)
        }
        return Image(systemName: "star.fill")
    }
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}

//
//  Person.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import Foundation
import UIKit
import SwiftUI
import MapKit

struct Person: Codable, Identifiable, Equatable {
    var id: UUID
    let name: String
    let image: Data
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
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

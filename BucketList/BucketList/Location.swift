//
//  Location.swift
//  BucketList
//
//  Created by Justin on 7/24/23.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}

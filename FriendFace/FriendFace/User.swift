//
//  User.swift
//  FriendFace
//
//  Created by Justin on 7/13/23.
//

import Foundation

struct User {
    let id: String
    let isActive: Bool = false
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

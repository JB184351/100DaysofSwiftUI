//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Justin on 7/14/23.
//
//

import Foundation
import CoreData


extension CachedFriend {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }
    
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    var wrappedID: String {
        id ?? "No ID"
    }
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
}

extension CachedFriend : Identifiable {
    
}

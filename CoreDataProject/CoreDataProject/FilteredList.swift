//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Justin on 7/12/23.
//

import SwiftUI

// Challenge 2: Modify String Parameter to use
// an ENUM
enum PredicateParameter: String {
    case beginsWith = "lastName BEGINSWITH %@"
    case endsWith = "ENDSWITH"
}

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    @State private var stringPredicate = ""
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    // Challenge 1: Change initializer to accept a string parameter
    // that allows a change of the predicate string
    init(filter: String, predicate: PredicateParameter) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "\(predicate.rawValue)", filter))
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}

//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Justin on 7/13/23.
//

import SwiftUI
import Combine

struct UserDetailView: View {
    let user: CachedUser
    
    var body: some View {
        VStack {
            Section {
                Text("I'm \(user.wrappedName)")
                Text("I'm \(user.age) years old")
                Text("Here's my \(user.wrappedAddress)")
                Text("Here's a list of my friends by name")
                
                ForEach(user.friendsArray, id: \.self) { friend in
                    Text(friend.wrappedName)
                }
            }
        }
    }
}

//
//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView()
//    }
//}

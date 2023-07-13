//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Justin on 7/13/23.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            Section {
                Text("I'm \(user.name)")
                Text("I'm \(user.age) years old")
                Text("Here's my \(user.address)")
                Text("Here's a list of my friends by name")
                
                ForEach(user.friends, id: \.self) { friend in
                    Text(friend.name)
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

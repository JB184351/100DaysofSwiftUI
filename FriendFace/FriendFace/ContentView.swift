//
//  ContentView.swift
//  FriendFace
//
//  Created by Justin on 7/13/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(cachedUsers, id: \.self) { user in
                Section {
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        Text(user.wrappedName)
                    }
                }
            }
            .onAppear {
                Task {
                    await fetchUsers()
                    
                    for user in users {
                        let newUser = CachedUser(context: moc)
                        newUser.name = user.name
                        newUser.id = user.id
                        newUser.isActive = user.isActive
                        newUser.age = Int16(user.age)
                        newUser.about = user.about
                        newUser.email = user.email
                        newUser.address = user.address
                        newUser.company = user.company
                        
                        for friend in user.friends {
                            let newFriend = CachedFriend(context: moc)
                            newFriend.id = friend.id
                            newFriend.name = friend.name
                            newFriend.user = newUser
                        }
                        
                        try? moc.save()
                    }
                }
            }
        }
    }
    
    func fetchUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Not a valid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let parsedUsers = try JSONDecoder().decode([User].self, from: data)
            users = parsedUsers
        } catch {
            print(error.localizedDescription)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

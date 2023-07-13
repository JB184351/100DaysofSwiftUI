//
//  ContentView.swift
//  FriendFace
//
//  Created by Justin on 7/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.self) { user in
                        Section {
                            NavigationLink {
                                UserDetailView(user: user)
                            } label: {
                                Text(user.name)
                            }
                        }
                }
            .onAppear {
                Task {
                    if users.isEmpty {
                        await fetchUsers()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

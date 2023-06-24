//
//  MoonShotGridView.swift
//  Moonshot
//
//  Created by Justin on 6/24/23.
//

import SwiftUI

struct MoonShotListView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                        .background(.darkBackground)
                        
                    }
                }
            }
            .listStyle(.plain)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .padding([.horizontal, .bottom])
        }
    }
}

struct MoonShotListView_Previews: PreviewProvider {
    static var previews: some View {
        MoonShotListView()
    }
}

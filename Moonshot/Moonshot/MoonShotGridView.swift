//
//  MoonShotGridView.swift
//  Moonshot
//
//  Created by Justin on 6/24/23.
//

import SwiftUI

struct MoonShotGridView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
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
                                    
                                    // Challenge 3 Day 76, Make Any Labels that say N/A say "Date Not Available"
                                    // because VoiceOver reads it as "N Slash A" by default
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                        .accessibilityLabel(mission.formattedLaunchDate == "N/A" ? "Mission Date Not Available" : mission.formattedLaunchDate)
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
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct MoonShotGridView_Previews: PreviewProvider {
    static var previews: some View {
        MoonShotGridView()
    }
}

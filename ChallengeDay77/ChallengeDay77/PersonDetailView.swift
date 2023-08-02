//
//  PersonLocationView.swift
//  ChallengeDay77
//
//  Created by Justin on 8/1/23.
//

import SwiftUI
import MapKit

struct PersonDetailView: View {
    var person: Person
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    person.getImage(from: person.image)
                        .resizable()
                        .scaledToFit()
                }
                
                Map(coordinateRegion: $region)
            }
            .navigationTitle(person.name)
        }
    }
}
    
//    struct PersonLocationView_Previews: PreviewProvider {
//        static var previews: some View {
//            PersonDetailView()
//        }
//    }

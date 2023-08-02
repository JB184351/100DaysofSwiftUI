//
//  AddPersonView.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import SwiftUI
import MapKit

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ViewModel()
    let locationFetcher = LocationFetcher()
    
    @State private var name = ""
    @State private var image: Image?
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                        .onTapGesture {
                            showImagePicker = true
                        }
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .onTapGesture {
                        print("Add Location")
                    }
                
                TextField("Add Name", text: $name)
                    .padding()
                
                Button("Add Person") {
                    guard let location = self.locationFetcher.lastKnownLocation else { return }
                    
                    viewModel.addPerson(name: name, image: selectedImage, latitude: location.latitude, longitude: location.longitude)
                    dismiss()
                }
                .disabled(name == "" && image == nil)
                
            }
            .onAppear {
                self.locationFetcher.start()
                region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: (locationFetcher.manager.location?.coordinate.latitude) ?? 51.507222, longitude: (locationFetcher.manager.location?.coordinate.longitude) ?? -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}

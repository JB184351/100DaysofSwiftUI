//
//  AddPersonView.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ViewModel()
    
    @State private var name = ""
    @State private var image: Image?
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
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
                
                TextField("Add Name", text: $name)
                    .padding()
                
                Button("Add Person") {
                    viewModel.addPerson(name: name, image: selectedImage)
                    dismiss()
                }
                .disabled(name == "" && image == nil)
                
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

//struct AddPersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPersonView()
//    }
//}

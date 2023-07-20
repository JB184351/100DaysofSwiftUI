//
//  ContentView.swift
//  Instafilter
//
//  Created by Justin on 7/15/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @State private var sliderText = "Intensity"
    
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                // Challenge 2, I played with seveal ideas on how to do this
                // I tried using an enum with the types to change the slider
                // text and separate properties instead of doing filterIntesnity * 200
                // or whatever, but found this wasn't feasbile so I settled with this for
                // now, might look up other solutions on how this could be better.
                HStack {
                    Text(sliderText)
                        .onChange(of: currentFilter.inputKeys) { newValue in
                            if newValue.contains(kCIInputIntensityKey) {
                                currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
                                sliderText = "Intensity"
                            }
                            if newValue.contains(kCIInputRadiusKey) {
                                currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
                                sliderText = "Radius"
                            }
                            if newValue.contains(kCIInputScaleKey) {
                                currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
                                sliderText = "Scale"
                            }
                        }
                    
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in applyProcessing() }
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    // Challenge 1 disable the
                    // save button if there is
                    // no image
                    Button("Save", action: save)
                        .disabled(image == nil)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage, perform: { _ in loadImage() })
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            // Technically the ones I added don't work for Challenge 3, I tried changing the keys appropriately but that seemed to cause a crash, but I know where to do it if I were to come back to this.
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Button("Crystallize") { setFilter(CIFilter.crystallize())}
                Button("Edges") { setFilter(CIFilter.edges())}
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur())}
                Button("Pixellate") { setFilter(CIFilter.pixellate())}
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone())}
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask())}
                Button("Vignette") { setFilter(CIFilter.vignette())}
//                Button("Accordion") { setFilter(CIFilter.accordionFoldTransition()) }
//                Button("Blend With Red Mask") { setFilter(CIFilter.blendWithRedMask()) }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        imageSaver.successHandler = {
            print("Success!")
        }
        
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

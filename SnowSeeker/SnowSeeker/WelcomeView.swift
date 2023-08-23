//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Justin on 8/21/23.
//

import SwiftUI

struct WelcomeView: View {
    
    
    var body: some View {
        VStack {
            Text("Welcome to Snowseeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
                .foregroundColor(.secondary)
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

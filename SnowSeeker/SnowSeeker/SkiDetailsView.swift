//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Justin on 8/21/23.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            Text("Elevation")
                .font(.caption.bold())
            
            Text("\(resort.elevation)m")
                .font(.title3)
        }
        .frame(maxWidth: .infinity)
        
        VStack {
            Text("Snow")
                .font(.caption.bold())
            Text("\(resort.snowDepth)cm")
                .font(.title3)
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}

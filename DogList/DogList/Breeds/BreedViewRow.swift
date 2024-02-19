//
//  BreedViewRow.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI
import SDWebImage

struct BreedViewRow: View {
    
//    let breed: Breed
    let breedNewMode: DogNameAndImage
//    let breedImage: BreedDetail
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: breedNewMode.dogImage)) { image in
             image
                 .resizable()
                 .scaledToFit()
            } placeholder: {
             ProgressView()
            }
            .frame(width: 100, height: 100)
            
            Text(breedNewMode.dogName)
                .font(.caption)
                .lineLimit(1)
        }
    }
}


/* */

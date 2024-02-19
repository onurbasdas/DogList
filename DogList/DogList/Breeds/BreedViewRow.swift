//
//  BreedViewRow.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI
import SDWebImage

struct BreedViewRow: View {
    
    let breedNewMode: DogNameAndImage
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: breedNewMode.dogImage)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
            } placeholder: {
                Image(systemName: "plus")
                    .frame(width: 170, height: 170)
            }
            .background(Color.white)
            
            Rectangle()
                .fill(Color.black)
                .opacity(0.5)
                .blur(radius: 5)
                .cornerRadius(8)
                .frame(width: 150, height: 40)
                .offset(x: -85, y: 70)
            
            Text(breedNewMode.dogName)
                .font(.caption)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(.white)
                .padding(.leading, -80)
                .padding(.top, 140)
        }
    }
}

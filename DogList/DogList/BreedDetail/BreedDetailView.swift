//
//  BreedDetailView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

struct BreedDetailView: View {
    @StateObject var breedDetailViewModel = BreedDetailViewModel()
    @State var breed: DogNameAndImage
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: breed.dogImage)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            
            Text(breed.dogName)
                .font(.caption)
                .lineLimit(1)
        }.navigationTitle(breed.dogName)
    }
}

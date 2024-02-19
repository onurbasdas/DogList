//
//  BreedDetailView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI
import SDWebImage

struct BreedDetailView: View {
    @StateObject var breedDetailViewModel = BreedDetailViewModel()
    @State private var isShowingPopup = false
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
            .frame(width: 400, height: 400)
            
            Text(breed.dogName)
                .font(.caption)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            Button("Show Popup") {
                isShowingPopup.toggle()
                breedDetailViewModel.getBreedDetails(breed: breed)
            }
            .sheet(isPresented: $isShowingPopup) {
                PopupView(name: breed.dogName)
            }
        }
        .navigationTitle(breed.dogName)
    }
}

struct PopupView: View {
    var name: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: name)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            Button("Close") {
                
            }
            .padding()
        }
    }
}

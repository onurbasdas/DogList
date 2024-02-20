//
//  BreedDetailView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI
import PopupView

struct BreedDetailView: View {
    @StateObject var breedDetailViewModel = BreedDetailViewModel()
    @State private var isPopupPresented = false
    @State var breed: DogNameAndImage
    
    var body: some View {
        ZStack {
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
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                Button("Generate") {
                    breedDetailViewModel.getBreedDetails(breed: breed)
                    isPopupPresented = true
                }
            }
            .popup(isPresented: $isPopupPresented) {
                PopupView(viewModel: breedDetailViewModel, isPresented: $isPopupPresented)
            } customize: {
                $0
                    .closeOnTap(false)
                    .backgroundColor(.black.opacity(0.4))
            }
            .navigationTitle(breed.dogName)
        }
    }
}


struct PopupView: View {
    @ObservedObject var viewModel: BreedDetailViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.breedDetail.first?.imageName ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 256, height: 256)
            .padding()
            
            Button {
                isPresented = false
            } label: {
                Image("ic_generateImageClose")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(8)
            }
            .padding()
        }
        .frame(width: 300, height: 250)
    }
}


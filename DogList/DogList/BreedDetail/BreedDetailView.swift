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
    @Binding var closeDetail: Bool
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    AsyncImage(url: URL(string: breed.dogImage)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 350)
                            .clipped()
                            .offset(y: -60)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 350, height: 350)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                closeDetail = false
                            } label: {
                                Image("ic_generateImageClose")
                                    .padding()
                            }
                        }
                        Spacer()
                    }
                }
                Text(breed.dogName)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .offset(y: -20)
                    .padding()
                    .foregroundColor(.blue)
                Button("Generate") {
                    breedDetailViewModel.getBreedDetails(breed: breed)
                    isPopupPresented = true
                }
                .frame(width: 312, height: 56)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
            }
            .popup(isPresented: $isPopupPresented) {
                PopupView(viewModel: breedDetailViewModel, isPresented: $isPopupPresented)
            } customize: {
                $0
                    .closeOnTap(false)
                    .backgroundColor(.black.opacity(0.4))
            }
            .frame(width: 350, height: 600)
            .background(Color.white)
        }
        .navigationTitle(breed.dogName)
        .cornerRadius(12)
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
                    .scaledToFill()
                    .clipped()
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

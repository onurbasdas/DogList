//
//  BreedView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI
import PopupView

struct BreedView: View {
    
    @StateObject var breedViewModel = BreedViewModel()
    @State private var searchText = ""
    @State private var selectedBreed: DogNameAndImage? = nil
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            VStack {
                Text("Dog List")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(breedViewModel.dogAndNameArray.filter {
                            searchText.isEmpty ? true : $0.dogName.localizedCaseInsensitiveContains(searchText)
                        }, id: \.self) { breed in
                            BreedViewRow(breedNewMode: breed)
                                .aspectRatio(1, contentMode: .fit)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedBreed = breed
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .onAppear {
            breedViewModel.getBreeds()
        }
        .popup(isPresented: Binding<Bool>(
            get: { selectedBreed != nil },
            set: { _ in selectedBreed = nil }
        )) {
            BreedDetailView(breed: selectedBreed ?? DogNameAndImage(dogName: "", dogImage: ""))
        } customize: {
            $0
                .closeOnTap(false)
                .backgroundColor(.black.opacity(0.4))
        }
        
    }
}

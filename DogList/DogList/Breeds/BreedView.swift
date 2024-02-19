//
//  BreedView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

struct BreedView: View {
    
    @StateObject var breedViewModel = BreedViewModel()
    @State private var searchText = ""
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(breedViewModel.dogAndNameArray.filter {
                            searchText.isEmpty ? true : $0.dogName.localizedCaseInsensitiveContains(searchText)
                        }, id: \.self) { breed in
                            NavigationLink(destination: BreedDetailView(breed: breed)) {
                                BreedViewRow(breedNewMode: breed)
                                    .aspectRatio(1, contentMode: .fit)
                                    .background(Color.gray)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Dog List")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.gray.opacity(0.2))
        }
        .onAppear {
            breedViewModel.getBreeds()
        }
    }
}

#Preview {
    BreedView()
}

//
//  BreedView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

struct BreedView: View {
    
    @StateObject var breedViewModel = BreedViewModel()
    @State var breeds: [Breed] = []
    
    var body: some View {
        NavigationView {
            NavigationStack(path: $breeds) {
                List {
                    ForEach(breedViewModel.breeds, id: \.self) { breed in
                        NavigationLink(destination: EmptyView()) {
                            BreedViewRow(breed: breed)
                        }
                    }
                }
                .navigationTitle("Dog Breeds")
            }
        }
        .onAppear {
            breedViewModel.getBreeds()
        }
    }

}

#Preview {
    BreedView()
}

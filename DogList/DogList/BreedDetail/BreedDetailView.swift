//
//  BreedDetailView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

struct BreedDetailView: View {
    @StateObject var breedDetailViewModel = BreedDetailViewModel()
    @State var breed: Breed
    
    var body: some View {
        VStack {
            List {
                ForEach(breedDetailViewModel.breedDetail, id: \.self) { breedDetail in
                    AsyncImage(url: URL(string: breedDetail.imageName)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                        case .failure(let error):
                            Text("error: \(error.localizedDescription)")
                        case .empty:
                            ProgressView()
                        @unknown default:
                            fatalError()
                        }
                    }
                }
            }
            .onAppear {
                breedDetailViewModel.getBreedDetails(breed: breed)
            }
        }.navigationTitle(breed.name)
    }
}

#Preview {
    BreedDetailView(breed: Breed(name: "Mock", subTitle: ""))
}

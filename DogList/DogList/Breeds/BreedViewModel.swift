//
//  BreedViewModel.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import Foundation

struct DogNameAndImage {
    var dogName: String
    var dogImage: String
}

@MainActor
class BreedViewModel: ObservableObject {
    
    let httpClient: HTTPClient
    
    @Published var breeds: [Breed]  = []
    
    var dogAndNameArray: [DogNameAndImage] = []
    
    init(httpClient: HTTPClient = NetworkClient()) {
        self.httpClient = httpClient
    }
    
    func getBreeds() {
        let endPoint = BreedEndPoint()
        Task {
            let result = await httpClient.sendRequest(endpoint: endPoint, responseModel: BreedResponse.self)
            switch result {
            case .success(let breedResponse):
                self.breeds = breedResponse.message.keys.map {
                    let values = breedResponse.message[$0]
                    getImage(image: $0.capitalized)
                    let subTitle = values?.joined(separator: ",  ")
                    
                    return Breed(name: $0.capitalized, subTitle: subTitle ?? "")
                }.sorted { $0.name < $1.name
                }
            case .failure:
                self.breeds = []
            }
        }
    }
    
    func getImage(image: String) {
        let endPoint = BreedDetailEndPoint(breedName: image)
        Task {
            let result = await httpClient.sendRequest(endpoint: endPoint, responseModel: BreedDetailResponse.self)
            switch result {
            case .success(let bredResponse): break
//                self.breedDetail = bredResponse
            case .failure:
                self.breeds = []
            }
        }
    }
}

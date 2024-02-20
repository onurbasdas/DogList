//
//  BreedDetailViewModel.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import Foundation

@MainActor
class BreedDetailViewModel: ObservableObject {
    
    let httpClient: HTTPClient
    
    @Published var breedDetail: [BreedDetail]  = []
    
    init(httpClient: HTTPClient = NetworkClient()) {
        self.httpClient = httpClient
    }
    
    func getBreedDetails(breed: BreedDetail) {
        let endPoint = BreedDetailEndPoint(breedName: breed.imageName)
    
        Task {
            let result =   await httpClient.sendRequest(endpoint: endPoint, responseModel: BreedDetailResponse.self)
            
            switch result {
            case .success(let breedDetailsResponse):
                breedDetail =    breedDetailsResponse.message  .map {
                 BreedDetail(imageName: $0)
                }
            case .failure(let error ):
                print( error)
            }
        }
    }

}

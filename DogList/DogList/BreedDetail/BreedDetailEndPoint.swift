//
//  BreedDetailEndPoint.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import Foundation

struct BreedDetailEndPoint: Endpoint {
    var header: [String: String]?
    
    var body: [String: String]?
    
    var breedName: String
    
    var path: String {
        return "/api/breed/\(breedName.lowercased())/images/random/1"
    }
    
    var method: RequestMethod {
        return .get
    }
}

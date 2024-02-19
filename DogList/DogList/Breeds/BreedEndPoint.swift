//
//  BreedEndPoint.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import Foundation

struct BreedEndPoint: Endpoint {
    var header: [String: String]?
    
    var body: [String: String]?
    
    var path: String {
        return "/api/breeds/list/all"
    }
    
    var method: RequestMethod {
        return .get
    }

}

//
//  BreedViewRow.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

struct BreedViewRow: View {
    
    let breed: Breed
    var body: some View {
        VStack(alignment: .leading) {
            Text(breed.name).fontWeight(.bold).font(.title2)
            Text(breed.subTitle)
            
        }
    }
}

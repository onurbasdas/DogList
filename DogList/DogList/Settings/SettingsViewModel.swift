//
//  SettingsViewModel.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var osVersion: String
    
    init() {
        osVersion = UIDevice.current.systemVersion
    }
}

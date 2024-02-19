//
//  DogListApp.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

@main
struct DogListApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}

var rootController: UIViewController? {
    var root = UIApplication.shared.windows.first?.rootViewController
    if let presenter = root?.presentedViewController { root = presenter }
    return root
}

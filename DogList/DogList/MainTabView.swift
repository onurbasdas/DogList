//
//  MainTabView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            BreedView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

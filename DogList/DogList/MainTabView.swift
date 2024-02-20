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
        .customTabBar()
    }
}

struct CustomTabBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                VStack {
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 1, height: 28)
                        Spacer()
                    }
                },
                alignment: .bottom
            )
    }
}

extension View {
    func customTabBar() -> some View {
        self.modifier(CustomTabBarModifier())
    }
}

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 60
        
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        if let shadowView = view.subviews.first(where: { $0.accessibilityIdentifier == "TabBarShadow" }) {
            shadowView.frame = tabBar.frame
        } else {
            let shadowView = UIView(frame: .zero)
            shadowView.frame = tabBar.frame
            shadowView.accessibilityIdentifier = "TabBarShadow"
            shadowView.backgroundColor = UIColor.white
            shadowView.layer.cornerRadius = tabBar.layer.cornerRadius
            shadowView.layer.maskedCorners = tabBar.layer.maskedCorners
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowColor = Color.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: 0.0, height: -8.0)
            shadowView.layer.shadowOpacity = 0.3
            shadowView.layer.shadowRadius = 10
            view.addSubview(shadowView)
            view.bringSubviewToFront(tabBar)
        }
    }
}

#Preview {
    MainTabView()
}

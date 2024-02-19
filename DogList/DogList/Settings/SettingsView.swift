//
//  SettingsView.swift
//  DogList
//
//  Created by Onur on 19.02.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @ObservedObject var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        RatingShareView
                        PrivacySupportView
                        OSVersionView
                    }.padding(.horizontal, 20)
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color.white.ignoresSafeArea())
        }

    }
}

private extension SettingsView {
    var OSVersionView: some View {
        HStack {
            Image(systemName: "gear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22, alignment: .center)
            Text("OS Version")
                .font(.system(size: 18))
            Spacer()
            Text(viewModel.osVersion)
                .foregroundColor(.gray)
        }
        .foregroundColor(.black)
        .padding()
    }
}

private extension SettingsView {
    func SettingsItem(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22, alignment: .center)
                Text(title)
                    .font(.system(size: 18))
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
        })
    }
}

private extension SettingsView {
    var RatingShareView: some View {
        VStack {
            Color.white.frame(height: 1).opacity(0.1)
            SettingsItem(title: "Rate App", icon: "star") {
                if let scene = UIApplication.shared.windows.first?.windowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
            Color.white.frame(height: 1).opacity(0.1)
            SettingsItem(title: "Share App", icon: "square.and.arrow.up") {
                let shareController = UIActivityViewController(activityItems: [AppConfig.myAppURL], applicationActivities: nil)
                rootController?.present(shareController, animated: true, completion: nil)
            }
        }
    }
}

private extension SettingsView {
    var PrivacySupportView: some View {
        VStack {
            Color.white.frame(height: 1).opacity(0.1)
            SettingsItem(title: "Terms of Use", icon: "doc.text") {
                UIApplication.shared.open(AppConfig.termsAndConditionsURL, options: [:], completionHandler: nil)
            }
            Color.white.frame(height: 1).opacity(0.1)
            SettingsItem(title: "Privacy Policy", icon: "hand.raised") {
                UIApplication.shared.open(AppConfig.privacyURL, options: [:], completionHandler: nil)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  ContentView.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-05.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboardingRequired3") var onboardingRequired: Bool = true
    
    var body: some View {
      
        TabView {
            HomeView()
                .tabItem {
                    Label("Employee", systemImage: "person.3.fill")
                }
            SettingsView(viewModel: SettingsViewModel())
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .fullScreenCover(isPresented: $onboardingRequired) {
            onboardingRequired = false
        } content: {
            OnboardingView(onboardingRequired: $onboardingRequired)
        }
    }
}

#Preview {
    ContentView()
}

//
//  OnboardingView.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-05.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var onboardingRequired: Bool
   
   
    var body: some View {
        VStack {
            //Header
            Text("Employee HR App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
            Spacer()
            
            // Rounded Image for Icon
            Image("workers")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.teal, lineWidth: 2)
                )
                .shadow(radius: 15)
                .padding(30)
            
            //Text
            HStack {
                Image(systemName: "sparkle.magnifyingglass")
                    .foregroundColor(.blue)
                    .font(.system(size: 60))
                    .padding(.horizontal)
                VStack(alignment: .leading) {
                    Text("New Features")
                        .font(.headline)
                    Text( "Discover employee list details and search them by name.")
                }
            }
            .padding()
            Spacer()
            Button {
                onboardingRequired = false
            } label: {
                Text("Continue")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding([.horizontal], 40)
            
        }
    }
}

#Preview {
    OnboardingView(onboardingRequired: .constant(true))
}


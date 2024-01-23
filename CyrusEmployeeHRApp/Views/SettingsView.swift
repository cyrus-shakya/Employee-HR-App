//
//  SettingsView.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-05.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
      
      var body: some View {
          VStack(alignment: .leading){
              Text("App Information")
                  .font(.largeTitle)
                  .fontWeight(.bold)
                  .padding(.bottom, 20)
              
              Text("App Name: \(viewModel.settingsModel.appName)")
                  .padding(.bottom, 10)
              
              HStack {
                        Spacer()
                        
                        Image("workers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.teal, lineWidth: 2)
                            )
                            .shadow(radius: 65)
                            .padding(20)

                        Spacer()
                    }
                  
              Text("App Description: \(viewModel.settingsModel.appDescription)")
                  .padding(.bottom, 10)
              
              Text("Developer Name: \(viewModel.settingsModel.developerName)")
                  .padding(.bottom, 10)
              
              Text("Student Number: \(viewModel.settingsModel.studentNumber)")
              
              Spacer()
          }
          .padding()
      }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}

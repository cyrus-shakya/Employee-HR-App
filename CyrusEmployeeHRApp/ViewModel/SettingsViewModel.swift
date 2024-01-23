//
//  SettingsViewModel.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-05.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var settingsModel: SettingsModel
    
    init() {
   
        self.settingsModel = SettingsModel(
            appName: "Employee HR App",
            appDescription: "Employee directory app that shows a list of employees details and also filter them by name.",
            developerName: "Cyrus Shakya",
            studentNumber: "1157720"
        )
    }
}

//
//  EmployeeViewModel.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-06.
//

import Foundation

class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var loadingData: Bool = false
    @Published var errorDescription: String?
    
    private let dataCache = DataCache.shared

    func fetchEmployees() {
        loadingData = true
        
        // First loading from cache
        if let cachedData = dataCache.loadData(for: "CacheForEmployee"),
            let cachedEmployees = try? JSONDecoder().decode([Employee].self, from: cachedData) {
            self.employees = cachedEmployees
            loadingData = false
        }
        
        // If not, fetch from network
        EmployeeApiServices.shared.fetchEmployees { [weak self] result in
            guard let self = self else { return }
            self.loadingData = false
            
            switch result {
            case .success(let employees):
                self.employees = employees
                // Save to cache
                if let data = try? JSONEncoder().encode(employees) {
                    self.dataCache.saveData(data, for: "CacheForEmployee")
                }
            case .failure(let error):
                self.errorDescription = self.message(for: error)
            }
        }
    }
    
    private func message(for error: ApiError) -> String {
        switch error {
        case .invalidURL:
            return "The URL for the employee data is invalid."
        case .noData:
            return "No data was found on the server."
        case .decodingError:
            return "Error decoding the employee data."
        case .httpResponseError:
            return "An unexpected server error occurred."
        }
    }
    
    
}

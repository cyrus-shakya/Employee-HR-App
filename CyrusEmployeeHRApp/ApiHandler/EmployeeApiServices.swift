//
//  EmployeeApiServices.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-09.
//

import Foundation
import UIKit

enum ApiError: Error {
    case invalidURL
    case noData
    case decodingError
    case httpResponseError
}

class EmployeeApiServices {
    
    static let shared = EmployeeApiServices()
    private let urlSession = URLSession.shared
    
    
    func fetchEmployees(completion: @escaping (Result<[Employee], ApiError>) -> Void) {
        let urlString = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(.failure(.httpResponseError))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(.failure(.httpResponseError))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                do {
                    let employeesResponse = try JSONDecoder().decode(EmployeesResponse.self, from: data)
                    completion(.success(employeesResponse.employees))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }
        task.resume()
    }
    
   
    
}

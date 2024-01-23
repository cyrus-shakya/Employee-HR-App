//
//  Employee.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-05.

import Foundation

struct Employee: Identifiable,Codable {
    let uuid: UUID
    let fullName: String
    let phoneNumber: String
    let emailAddress: String
    let biography: String
    let photoURLSmall: URL?
    let photoURLLarge: URL?
    let team: String
    let employeeType: EmployeeType
    
    var id: UUID { uuid }
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}

enum EmployeeType: String, Codable {
    case fullTime = "FULL_TIME"
    case temporary = "PART_TIME"
    case permanent = "CONTRACTOR"
}


struct EmployeesResponse: Codable {
    let employees: [Employee]
}

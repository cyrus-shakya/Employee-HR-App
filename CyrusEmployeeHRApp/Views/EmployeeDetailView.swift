//
//  EmployeeDetailView.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-09.


import SwiftUI

struct EmployeeDetailView: View {

    var employee: Employee
    
    var body: some View {
        VStack(spacing: 10)  {
            if let photoURL = employee.photoURLLarge {
                AsyncImage(url: photoURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.teal, lineWidth: 2))
                .shadow(radius: 5)
            }
            
            Section(header: Text(employee.fullName).fontWeight(.bold).font(.title).foregroundColor(.teal)) {
                EmployeeDetailRow(title: "Phone:", value: employee.phoneNumber)
                EmployeeDetailRow(title: "Email:", value: employee.emailAddress)
                EmployeeDetailRow(title: "Biography:", value: employee.biography)
                EmployeeDetailRow(title: "Team:", value: employee.team)
                
                if (employee.employeeType.rawValue == "FULL_TIME"){
                    EmployeeDetailRow(title: "Type:", value: "Full time")
                }
                else if (employee.employeeType.rawValue == "PART_TIME"){
                    EmployeeDetailRow(title: "Type:", value: "Part time")
                }
                else{
                    EmployeeDetailRow(title: "Type:", value: "Contractor")
                }
            }
            Spacer()
        }
    }
}



struct EmployeeDetailRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(value)
        }
        .padding([.top,.leading, .trailing], 10)
    }
}


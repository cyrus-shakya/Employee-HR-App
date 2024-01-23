//
//  EmployeeRow.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-09.
//

import SwiftUI

struct EmployeeRow: View {

    var employee: Employee
    
    var body: some View {
        HStack {
            
            if let photoURL = employee.photoURLSmall {
                AsyncImage(url: photoURL) { phase in
                    switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable().scaledToFit()
                        case .failure:
                            Image(systemName: "person.crop.circle.badge.exclamationmark")
                        @unknown default:
                            EmptyView()
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            } else {
                Image(systemName: "person.fill").resizable().frame(width: 60, height: 60)
            }
          

            VStack(alignment: .leading) {
                Text(employee.fullName)
                    .font(.headline)
                HStack{
                    Text("Team:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(employee.team)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}





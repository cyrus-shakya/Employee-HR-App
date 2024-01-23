//
//  HomeView.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-05.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = EmployeeViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.employees.filter { searchText.isEmpty || $0.fullName.localizedCaseInsensitiveContains(searchText) }) { employee in
                    NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                        EmployeeRow(employee: employee)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for name")
            .navigationTitle("Employees")
            .onAppear {
                viewModel.fetchEmployees()
            }
            .refreshable {
                viewModel.fetchEmployees()
            }
        }
    }
}

#Preview {
    HomeView()
}

//
//  DataCache.swift
//  CyrusEmployeeHRApp
//
//  Created by Cyrus Shakya on 2023-12-09.
//


import Foundation

class DataCache {
    static let shared = DataCache()
    private init() {}

    func saveData(_ data: Data, for key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }

    func loadData(for key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
}


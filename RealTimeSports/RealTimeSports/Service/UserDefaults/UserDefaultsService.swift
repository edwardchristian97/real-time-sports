//
//  UserDefaultsService.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 25.10.2024.
//
import Foundation

class UserDefaultsService: UserDefaultsServiceProtocol {

    static let recentSearchesKey: String = "recentSearches"

    let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func setRecentSearches(_ value: [String], forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    func getRecentSearches(forKey key: String) -> [String] {
        userDefaults.array(forKey: key) as? [String] ?? []
    }

}

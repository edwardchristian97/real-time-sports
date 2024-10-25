//
//  UserDefaultsServiceProtocol.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 25.10.2024.
//

protocol UserDefaultsServiceProtocol {

    func setRecentSearches(_ value: [String], forKey key: String)
    func getRecentSearches(forKey key: String) -> [String]

}

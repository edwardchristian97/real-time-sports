//
//  CommonError.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import Foundation

enum CommonError: Error {

    case noInternetConnection
    case unexpectedError
}

extension CommonError: LocalizedError {
    
    var userFriendlyDescription: String {
        switch self {
        case .noInternetConnection:
            return LocalizableStrings.noInternetConnection.localized
        case .unexpectedError:
            return LocalizableStrings.unexpectedError.localized
        }
    }

}

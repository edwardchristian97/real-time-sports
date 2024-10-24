//
//  LeagueError.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import Foundation

enum LeagueError: Error {

    case commonError(CommonError)
    case noAvailableStandings
    
}

extension LeagueError: LocalizedError {

    var userFriendlyDescription: String {
        switch self {
        case .commonError(let error):
            return error.userFriendlyDescription
        case .noAvailableStandings:
            return LocalizableStrings.noAvailableStandings.localized
        }
    }

}

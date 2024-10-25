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
    case noLeaguesFound
    case noLeagueFound
    case failedDecodingAllLeagues
    case failedDecodingStandings
    case failedDecodingLeague
    case failedAllLeaguesRequest
    case failedLeagueRequest
    case failedLeagueStandingsRequest
    case noLeagueImageDataDownloaded
    case failedDownloadingLeagueImage

}

extension LeagueError: LocalizedError {

    var userFriendlyDescription: String {
        switch self {
        case .commonError(let error):
            return error.userFriendlyDescription
        case .noAvailableStandings:
            return LocalizableStrings.noAvailableStandings.localized
        case .noLeaguesFound:
            return LocalizableStrings.noLeaguesFound.localized
        default:
            return LocalizableStrings.unexpectedError.localized
        }
    }

}

//
//  LocalizableString.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

enum LocalizableStrings: String {

    case homeTitle
    case leaguesTitle
    case noAvailableStandings
    case noInternetConnection
    case unexpectedError
    case rankSymbol
    case teamRankHeaderTitle
    case teamPointsHeaderTitle
    case teamsTitle
    case playersTitle
    case eventsTitle
    case searchPlaceholderTitle
    case noResultsFound
    case liveTitle
    case noLiveEvents
    case noLeaguesFound

    var localized: String {
        String(localized: String.LocalizationValue(rawValue))
    }

}

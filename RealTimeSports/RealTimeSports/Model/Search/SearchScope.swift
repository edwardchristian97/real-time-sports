//
//  SearchScope.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

enum SearchScope {

    case teams
    case players
    case events

    var title: String {
        switch self {
        case .teams: 
            return LocalizableStrings.teamsTitle.localized
        case .players:
            return LocalizableStrings.playersTitle.localized
        case .events:
            return LocalizableStrings.eventsTitle.localized
        }
    }

}

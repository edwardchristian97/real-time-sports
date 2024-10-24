//
//  ViewModelFactory.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

class ViewModelFactory {

    private static let service = ServiceFactory.makeServices()

    static func makeLeaguesViewModel() -> LeaguesViewModel {
        LeaguesViewModel(leaguesService: service.leagueService)
    }

    static func makeLeagueStandingsViewModel() -> LeagueStandingsViewModel {
        LeagueStandingsViewModel(leaguesService: service.leagueService)
    }

}
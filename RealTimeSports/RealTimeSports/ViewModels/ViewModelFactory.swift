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

    static func makePlayerViewModel() -> PlayerViewModel {
        PlayerViewModel(playerService: service.playerService)
    }

    static func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(playerService: service.playerService, teamService: service.teamService)
    }

    static func makeLiveEventViewModel() -> LiveEventViewModel {
        LiveEventViewModel(liveEventService: service.liveEventService)
    }

}

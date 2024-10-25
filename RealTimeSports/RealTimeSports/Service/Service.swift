//
//  Service.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import Foundation

class Service {

    fileprivate(set) var leagueService: LeagueServiceProtocol!
    fileprivate(set) var playerService: PlayerServiceProtocol!
    fileprivate(set) var liveEventService: LiveEventServiceProtocol!
    fileprivate(set) var userDefaultsService: UserDefaultsServiceProtocol!
    fileprivate(set) var httpClient: HTTPClient!

}

class ServiceFactory {

    static func makeServices() -> Service {
        let service = Service()

        service.httpClient = HTTPClient()

        service.leagueService = LeagueService(
            urlBuilder: URLBuilder(),
            urlBuilderV2: CommonURLBuilder(),
            httpClient: service.httpClient)

        service.playerService = PlayerService(
            urlBuilder: CommonURLBuilder(),
            httpClient: service.httpClient)

        service.liveEventService = LiveEventService(
            urlBuilder: CommonURLBuilder(),
            httpClient: service.httpClient)

        service.userDefaultsService = UserDefaultsService()

        return service
    }

}

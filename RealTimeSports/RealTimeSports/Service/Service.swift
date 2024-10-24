//
//  Service.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import Foundation

class Service {

    fileprivate(set) var teamService: TeamServiceProtocol!
    fileprivate(set) var leagueService: LeagueServiceProtocol!
    fileprivate var httpClient: HTTPClient!

}

class ServiceFactory {

    static func makeServices() -> Service {
        let service = Service()

        service.httpClient = HTTPClient()
        service.teamService = TeamService(
            urlBuilder: CommonURLBuilder(),
            httpClient: service.httpClient)
        service.leagueService = LeagueService(
            urlBuilder: URLBuilder(),
            urlBuilderV2: CommonURLBuilder(),
            httpClient: service.httpClient)

        return service
    }

}

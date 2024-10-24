//
//  LeagueResponse.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

struct LeagueResponse: Codable {

    let idLeague: String
    let strCountry: String?
    let strLeague: String
    let strSport: String
    let strBadge: String?
}

struct AllLeaguesResponse: Codable {

    let all: [LeagueResponse]

}

struct LookupLeagueResponse: Codable {

    let lookup: [LeagueResponse]
    
}

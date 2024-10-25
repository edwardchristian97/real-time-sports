//
//  LiveEventResponse.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

struct LiveEventResponse: Codable {

    let strLeague: String?
    let strHomeTeam: String?
    let strAwayTeam: String?
    let intHomeScore: String?
    let intAwayScore: String?
    let strProgress: String?

}

struct LiveScoreResponse: Codable {

    let livescore: [LiveEventResponse]

}

//
//  TeamResponse.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

struct TeamResponse: Codable {

    let idTeam: String
    let strTeam: String
    let strBadge: String?
    let intRank: String?
    let intPoints: String?

}

struct TableTeamResponse: Codable {

    let table: [TeamResponse]

}

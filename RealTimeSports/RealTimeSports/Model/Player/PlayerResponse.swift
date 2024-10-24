//
//  PlayerResponse.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

struct PlayerResponse: Codable {

    let idPlayer: String
    let strPlayer: String
    let strTeam: String?
    let dateBorn: String?
    let strThumb: String?

}

struct PlayerSearchResponse: Codable {

    let search: [PlayerResponse]

}

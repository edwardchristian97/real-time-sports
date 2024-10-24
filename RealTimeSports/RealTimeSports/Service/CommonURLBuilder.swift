//
//  CommonURLBuilder.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import Foundation

class CommonURLBuilder: URLBuilderV2 {

    let teamKey = "team"
    let playerKey = "player"
    let leagueKey = "league"
    let leaguesKey = "leagues"
    let livescoreKey = "livescore"

    var allURL: URL {
        baseUrl.appendingPathComponent("all")
    }

    var lookupURL: URL {
        baseUrl.appendingPathComponent("lookup")
    }

    var listURL: URL {
        baseUrl.appendingPathComponent("list")
    }

    var searchURL: URL {
        baseUrl.appendingPathComponent("search")
    }

    var filterURL: URL {
        baseUrl.appendingPathComponent("filter")
    }

}

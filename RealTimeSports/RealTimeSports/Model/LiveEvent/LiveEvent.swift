//
//  LiveEvent.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

struct LiveEvent {

    let league: String
    let homeTeamName: String
    let awayTeamName: String
    let homeTeamScore: String
    let awayTeamScore: String
    let progressTime: String

    init(from liveEventResponse: LiveEventResponse) {
        self.league = liveEventResponse.strLeague
        self.homeTeamName = liveEventResponse.strHomeTeam
        self.awayTeamName = liveEventResponse.strAwayTeam
        self.homeTeamScore = liveEventResponse.intHomeScore
        self.awayTeamScore = liveEventResponse.intAwayScore
        self.progressTime = liveEventResponse.strProgress
    }

}

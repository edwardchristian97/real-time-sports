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
        self.league = liveEventResponse.strLeague ?? ""
        self.homeTeamName = liveEventResponse.strHomeTeam ?? ""
        self.awayTeamName = liveEventResponse.strAwayTeam ?? ""
        self.homeTeamScore = liveEventResponse.intHomeScore ?? "0"
        self.awayTeamScore = liveEventResponse.intAwayScore ?? "0"

        if let progressTime = liveEventResponse.strProgress {
            if let progressTimeInt = Int(progressTime) {
                self.progressTime = "\(progressTimeInt)'"
            } else {
                self.progressTime = progressTime
            }
        } else {
            self.progressTime = ""
        }
    }

}

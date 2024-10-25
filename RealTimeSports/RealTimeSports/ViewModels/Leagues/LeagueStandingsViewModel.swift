//
//  LeagueStandingsViewModel.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//
import UIKit
import Alamofire

class LeagueStandingsViewModel {

    private let dispatchGroup: DispatchGroup
    private let leaguesService: LeagueServiceProtocol

    init(leaguesService: LeagueServiceProtocol) {
        self.dispatchGroup = DispatchGroup()
        self.leaguesService = leaguesService
    }

    func fetchLeagueStandings(id: String, completion: @escaping (Result<[Team], LeagueError>) -> Void) {
        var teamsWithImages: [Team] = []

        leaguesService.leagueStandings(id: id) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let teams):
                for team in teams {
                    self.dispatchGroup.enter()

                    guard let imageURL = team.strBadge else {
                        self.dispatchGroup.leave()
                        return completion(.failure(.commonError(.unexpectedError)))
                    }

                    self.leaguesService.downloadImage(url: URL(string: imageURL)!) { result in
                        switch result {

                        case .success(let imageData):

                            let teamWithImage = Team(
                                id: team.idTeam,
                                name: team.strTeam,
                                leagueRank: team.intRank,
                                leaguePoints: team.intPoints,
                                image: UIImage(data: imageData))
                            teamsWithImages.append(teamWithImage)
                            self.dispatchGroup.leave()

                        case .failure(let error):
                            completion(.failure(error))
                            self.dispatchGroup.leave()
                        }
                    }
                }

                self.dispatchGroup.notify(queue: DispatchQueue.main) {
                    completion(.success(teamsWithImages.sorted { Int($0.leagueRank ?? "") ?? 0 < Int($1.leagueRank ?? "") ?? 0 }))
                }

            case .failure(_):
                completion(.failure(.noAvailableStandings))
            }
        }
    }

}

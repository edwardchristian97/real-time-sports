//
//  LeaguesViewModel.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import UIKit
import Alamofire

class LeaguesViewModel {

    private let dispatchGroup: DispatchGroup
    private let leaguesService: LeagueServiceProtocol

    init(leaguesService: LeagueServiceProtocol) {
        self.dispatchGroup = DispatchGroup()
        self.leaguesService = leaguesService
    }

    func fetchAllLeagues(completion: @escaping (Result<[League], AFError>) -> Void) {
        var leaguesWithImage = [League]()

        leaguesService.allLeagues { result in
            switch result {
            case .success(let leagues):
                let filteredLeague = self.filterLeagues(leagues, by: .football)

                for league in filteredLeague {
                    self.dispatchGroup.enter()

                    self.leaguesService.league(id: league.idLeague) { result in
                        switch result {
                        case .success(let league):
                            guard let imageURL = league.strBadge else {
                                self.dispatchGroup.leave()
                                return completion(.failure(.explicitlyCancelled))
                            }

                            self.leaguesService.downloadImage(url: URL(string: imageURL)!) { result in
                                switch result {

                                case .success(let imageData):
                                    let leagueWithImage = League(
                                        id: league.idLeague,
                                        country: league.strCountry ?? "",
                                        name: league.strLeague,
                                        image: UIImage(data: imageData))
                                    leaguesWithImage.append(leagueWithImage)

                                    self.dispatchGroup.leave()

                                case .failure(let error):
                                    print(error)
                                    self.dispatchGroup.leave()
                                }
                            }

                        case .failure(let error):
                            print(error)
                        }
                    }
                }

                self.dispatchGroup.notify(queue: DispatchQueue.main) {
                    completion(.success(leaguesWithImage.sorted { $0.country < $1.country }))
                }

            case .failure(let error):
                print(error)
            }
        }
    }

    private func filterLeagues(_ leagues: [LeagueResponse], by leagueType: LeagueType) -> [LeagueResponse] {
        leagues.filter { $0.strSport == leagueType.rawValue}
    }

}

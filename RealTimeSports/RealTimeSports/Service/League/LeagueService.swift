//
//  LeagueService.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import Alamofire

class LeagueService: LeagueServiceProtocol {

    private let urlBuilder: URLBuilder
    private let urlBuilderV2: CommonURLBuilder
    private let httpClient: HTTPClient
    private let dispatchGroup: DispatchGroup

    init(urlBuilder: URLBuilder, urlBuilderV2: CommonURLBuilder, httpClient: HTTPClient) {
        self.urlBuilder = urlBuilder
        self.urlBuilderV2 = urlBuilderV2
        self.httpClient = httpClient
        self.dispatchGroup = DispatchGroup()
    }

    func league(id: String, completion: @escaping (Result<LeagueResponse, AFError>) -> Void) {
        var request = URLRequest(
            url: urlBuilderV2
                .lookupURL
                .appendingPathComponent(urlBuilderV2.leagueKey)
                .appendingPathComponent(id)
        )

        request.httpMethod = HTTPMethodType.get.rawValue
        request.setValue(urlBuilderV2.apiKey, forHTTPHeaderField: urlBuilderV2.apiHeader)

        httpClient.getRequest(url: request) { result in
            switch result {
            case .success(let data):
                if let data {
                    do {
                        let response = try JSONDecoder().decode(LookupLeagueResponse.self, from: data)
                        completion(.success(response.lookup[0]))
                    } catch {
                        completion(.failure(.explicitlyCancelled))
                    }
                } else {
                    completion(.failure(.explicitlyCancelled))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func allLeagues(completion: @escaping (Result<[LeagueResponse], AFError>) -> Void) {
        var request = URLRequest(url: urlBuilderV2.allURL.appendingPathComponent(urlBuilderV2.leaguesKey))

        request.httpMethod = HTTPMethodType.get.rawValue
        request.setValue(urlBuilderV2.apiKey, forHTTPHeaderField: urlBuilderV2.apiHeader)

        httpClient.getRequest(url: request) { result in
            switch result {

            case .success(let data):
                if let data {
                    do {
                        let response = try JSONDecoder().decode(AllLeaguesResponse.self, from: data)
                        let filteredResponse = Array(response.all.prefix(15))
                        completion(.success(filteredResponse))
                    } catch {
                        completion(.failure(.explicitlyCancelled))
                    }
                } else {
                    completion(.failure(.explicitlyCancelled))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }

    }

    func leagueStandings(id: String, completion: @escaping (Result<[TeamResponse], LeagueError>) -> Void) {
        var url = urlBuilder.baseUrl.appendingPathComponent("lookuptable.php")
        url.append(queryItems: [URLQueryItem(name: "l", value: id), URLQueryItem(name: "s", value: "2022-2023")])

        httpClient.getRequest(url: URLRequest(url: url)) { result in
            switch result {

            case .success(let data):
                if let data {
                    do {
                        let response = try JSONDecoder().decode(TableTeamResponse.self, from: data)
                        completion(.success(response.table))
                    } catch {
                        completion(.failure(.commonError(.unexpectedError)))
                    }
                } else {
                    completion(.failure(.noAvailableStandings))
                }

            case .failure(_):
                completion(.failure(.commonError(.unexpectedError)))
            }
        }
    }

    func downloadImage(url: URL, completion: @escaping (Result<Data, AFError>) -> Void) {
        httpClient.getRequest(url: URLRequest(url: url)) { result in
            switch result {
                
            case .success(let data):
                if let data {
                    completion(.success(data))
                } else {
                    completion(.failure(.explicitlyCancelled))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

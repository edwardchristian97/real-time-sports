//
//  LiveEventService.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import Foundation

class LiveEventService: LiveEventServiceProtocol {

    private let urlBuilder: CommonURLBuilder
    private let httpClient: HTTPClient

    init(urlBuilder: CommonURLBuilder, httpClient: HTTPClient) {
        self.urlBuilder = urlBuilder
        self.httpClient = httpClient
    }

    func fetchAllLiveEvents(completion: @escaping (Result<[LiveEventResponse], LiveEventError>) -> Void) {
        var request = URLRequest(
            url: urlBuilder
                .livescoreURL
                .appendingPathComponent(urlBuilder.allKey)
        )

        request.httpMethod = HTTPMethodType.get.rawValue
        request.setValue(urlBuilder.apiKey, forHTTPHeaderField: urlBuilder.apiHeader)

        httpClient.getRequest(url: request) { result in
            switch result {
            case .success(let data):
                if let data {
                    do {
                        let response = try JSONDecoder().decode(LiveScoreResponse.self, from: data)

                        // Return only the matches that are live, NS means the game didn't start
                        let livescore = response.livescore.filter { $0.strProgress != "NS" }
                        completion(.success(livescore))
                    } catch {
                        completion(.failure(.failureLiveScoreResponseDecoding))
                    }
                } else {
                    completion(.failure(.failedFetchingLiveScoreData))
                }
            case .failure(_):
                completion(.failure(.failedFetchingLiveScoreData))
            }

        }
    }

}

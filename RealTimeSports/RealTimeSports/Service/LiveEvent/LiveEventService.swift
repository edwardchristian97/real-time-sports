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
                .appendingPathComponent(urlBuilder.soccerKey)
        )

        request.httpMethod = HTTPMethodType.get.rawValue
        request.setValue(urlBuilder.apiKey, forHTTPHeaderField: urlBuilder.apiHeader)

        httpClient.getRequest(url: request) { result in
            switch result {
            case .success(let data):
                if let data {
                    do {
                        let response = try JSONDecoder().decode(LiveScoreResponse.self, from: data)
                        completion(.success(response.livescore))
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

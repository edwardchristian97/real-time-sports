//
//  LiveEventViewModel.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import UIKit

class LiveEventViewModel {

    private let liveEventService: LiveEventServiceProtocol

    init(liveEventService: LiveEventServiceProtocol) {
        self.liveEventService = liveEventService
    }

}

// MARK: Actions
extension LiveEventViewModel {

    func fetchAllLiveEvents(completion: @escaping (Result<[LiveEvent], LiveEventError>) -> Void) {
        liveEventService.fetchAllLiveEvents { result in
            switch result {
            case .success(let response):
                let liveEvents = response.map { LiveEvent(from: $0) }
                completion(.success(liveEvents))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

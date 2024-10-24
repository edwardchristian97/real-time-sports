//
//  LiveEventError.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import Foundation

enum LiveEventError: Error {

    case commonError(CommonError)
    case failureLiveScoreResponseDecoding
    case failedFetchingLiveScoreData

}

extension LiveEventError: LocalizedError {

    var userFriendlyDescription: String {
        switch self {
        case .commonError(let error):
            return error.userFriendlyDescription
        default:
            return LocalizableStrings.noLiveEvents.localized
        }
    }

}

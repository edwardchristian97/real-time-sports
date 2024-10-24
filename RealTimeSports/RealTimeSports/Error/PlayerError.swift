//
//  PlayerError.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 24.10.2024.
//

import Foundation

enum PlayerError: Error {

    case commonError(CommonError)
    case failedPlayerSearchResponseDecoding
    case failedSearchPlayerRequest
    case noImageDataDownloaded
    case failedImageDownloadRequest

}

extension PlayerError: LocalizedError {

    var userFriendlyDescription: String {
        switch self {
        case .commonError(let error):
            return error.userFriendlyDescription
        default:
            return LocalizableStrings.unexpectedError.localized
        }
    }

}


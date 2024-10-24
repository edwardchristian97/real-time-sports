//
//  URLBuilderV2.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import Foundation

class URLBuilderV2 {

    var baseUrl: URL! { URL(string: "https://www.thesportsdb.com/api/v2/json") }
    var apiKey: String { "360858" }
    var apiHeader: String { "X-API-KEY" }

}

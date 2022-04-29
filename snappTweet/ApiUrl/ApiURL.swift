//
//  ApiURL.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import Foundation
struct ApiURL {
    static var token =  "AAAAAAAAAAAAAAAAAAAAAKyNbgEAAAAA9ykjYQ5hXgNYnH720uFHPGizouc%3DNjzh1BAXBZcvS02lQJloVWS6Zdoz50QFSIa5DOcBrLxk8DWET4"
    static var baseUrl = "https://api.twitter.com/2/tweets/"
    static var search = "search/recent"
    static var rule = "search/stream/rules"
    static var streaming = "\(baseUrl)search/stream"
    static var list_search = "\(baseUrl + search)"
    static var tweet_rule = "\(baseUrl + rule)"

}

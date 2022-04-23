//
//  ApiURL.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import Foundation
struct ApiURL {
    static var token =  "AAAAAAAAAAAAAAAAAAAAAAydUgEAAAAAZPVstu8OXsmm%2FvUZ0q6RhaicmJo%3Dcc1LyqDbZgNwiWA64ZSDpagnlFMpnVPTyyGrpPMGkNoYWMG7V5"
    static var baseUrl = "https://api.twitter.com/2/tweets/"
    static var search = "search/recent"
    static var list_search = "\(baseUrl + search)"

}

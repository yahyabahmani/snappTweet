//
//  ApiClientProtocol.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import Foundation
protocol ApiClientProtocol {
  func getShareList(query: String, success succeeds:@escaping ([TweetModel])->(), failure failed:@escaping (Error)->())
}

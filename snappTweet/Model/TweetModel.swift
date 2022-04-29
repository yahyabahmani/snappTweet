//
//  TweetModel.swift
//  snappTweet
//
//  Created by yahya on 4/22/22.
//

import Foundation
struct TweetData: Codable {
  var data: TweetModel
}
struct TweetModel: Codable {
  let id: String
  let text: String
}


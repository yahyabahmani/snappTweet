//
//  TweetRuleModel.swift
//  snappTweet
//
//  Created by yahya on 4/29/22.
//

import Foundation
struct TweetRule:Codable{
  var data: [TweetRuleData]?
}
struct TweetRuleData:Codable{
  let id: String?
  let value: String?
}

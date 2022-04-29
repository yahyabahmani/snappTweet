//
//  TweetRequest.swift
//  snappTweet
//
//  Created by yahya on 4/29/22.
//

import Foundation
struct TweetAddRuleRequest:Codable{
  var add:[TweetAddRuleValue]?
  struct TweetAddRuleValue:Codable{
    var value:String?
  }
}

struct TweetRemoveRuleRequest:Codable{
  var delete:TweetRemoveRuleValue?
  struct TweetRemoveRuleValue:Codable{
    var ids:[String]?
  }
}



struct TweetRemoveResult:Codable{
  var meta:TweetRemoveResultMeta?
  
  struct TweetRemoveResultMeta:Codable{
    var sent:String?
  }
}

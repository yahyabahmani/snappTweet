//
//  MembershipRepository.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import Foundation
struct MembershipRepository: ApiClientProtocol {

  
  func addRule(query: String, success succeeds:@escaping (TweetRuleData?)->(), failure failed:@escaping (Error)->()){
      let url = ApiURL.tweet_rule
      let value = TweetAddRuleRequest.TweetAddRuleValue(value: query)
      let parameter = TweetAddRuleRequest(add: [value]).dictionary

     HTTPService.request(method: .post, parameter: parameter, andUrl: url, succeeded: { (result:TweetRule) in
       succeeds(result.data?.first)
       
     }){ error in
       failed(error)
     }
 }
  
  func removeRule(query: String, success succeeds:@escaping (TweetRemoveResult)->(), failure failed:@escaping (Error)->()){
      let url = ApiURL.tweet_rule
      let value = TweetRemoveRuleRequest.TweetRemoveRuleValue(ids: [query])
      let parameter = TweetRemoveRuleRequest(delete: value).dictionary

    HTTPService.request(method: .post, parameter: parameter, andUrl: url, succeeded: { (result:TweetRemoveResult) in
       succeeds(result)
       
     }){ error in
       failed(error)
     }
 }
  
  func getStream( success succeeds:@escaping (TweetData)->(), failure failed:@escaping (Error)->()){
    let url = ApiURL.streaming
    HTTPService.streamRequest(method: .get, andUrl: url) { (result:TweetData) in
      succeeds(result)

    } failure: { error in
      failed(error)

    }

 }
  
  
  
}


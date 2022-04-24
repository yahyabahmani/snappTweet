//
//  MembershipRepository.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import Foundation
struct MembershipRepository: ApiClientProtocol {
   func getShareList(query: String, success succeeds:@escaping ([TweetModel])->(), failure failed:@escaping (Error)->()){
      let url = ApiURL.list_search
      let params = ["query": query]
      HTTPService.request(method: .get, parameter: params, andUrl: url, succeeded: { (result:TweetData) in
        succeeds(result.data)
      }){ error in
        failed(error)
      }
  }  
}

//
//  MockModelTweet.swift
//  snappTweetTests
//
//  Created by yahya on 4/23/22.
//

import Foundation
@testable import snappTweet
class MockModelTweet:ApiClientProtocol{
  func addRule(query: String, success succeeds: @escaping (TweetRuleData?) -> (), failure failed: @escaping (Error) -> ()) {
    
  }
  
  func removeRule(query: String, success succeeds: @escaping (TweetRemoveResult) -> (), failure failed: @escaping (Error) -> ()) {
    
  }
  
  func getStream(success succeeds: @escaping (TweetData) -> (), failure failed: @escaping (Error) -> ()) {
    
  }
  
  var shouldReturnFalse = false
  
  enum MockServiceError:Error{
    case getList
    
  }
  convenience init() {
    self.init(false)
  }
  
  init(_ shouldReturnFalse:Bool){
    self.shouldReturnFalse = shouldReturnFalse
    
  }
  
  
  var tweetMode = [TweetModel(id: "1517786496018833409", text: "@cecep_teadi Hello Cecep teadi!\n\nYou've been randomly selected as the winner for @WSDC_NFT presale/white-list spot, for their NFT!\n\nTo claim your spot, fill the form in their bio and message @WSDC_NFT the word \"DONE\" https://t.co/OaJm2pBmnI")]
  
  func getShareList(query: String, success succeeds: @escaping ([TweetModel]) -> (), failure failed: @escaping (Error) -> ()) {
    if shouldReturnFalse{
      failed(MockServiceError.getList)
   
    }else{
      succeeds(self.tweetMode)
    }
  }
  

  
  
}


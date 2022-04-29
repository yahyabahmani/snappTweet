//
//  MainViewModel.swift
//  snappTweet
//
//  Created by yahya on 4/22/22.
//

import UIKit
import Combine

final class MainViewModel: BaseViewModel {
    let tweets = CurrentValueSubject<[TweetModel], Never>([TweetModel]())
    let searchText = PassthroughSubject<String, Never>()
    var subsciptions = Set<AnyCancellable>()
    let membershipRepository = MembershipRepository()
    var tweetRule : TweetRuleData?
  func search_query() {
    searchText
      .removeDuplicates()
      .debounce(for: .milliseconds(1000), scheduler: DispatchQueue.main)
      .receive(on: DispatchQueue.main)
      .sink { text in

        self.checkAdd_Remove(text: text)

      }.store(in: &subsciptions)
  }
    func showDetails(_ text: String) {
    (self.coordinator as? MainCoordinator)?.showShareList(text)
  }
  
  func checkAdd_Remove(text:String) {
    if let rule = self.tweetRule {
      self.removeRule(rule: rule,text: text)
    }else{
      self.addRule(txt: text)
    }
    
  }
  func addRule(txt:String) {
    guard !txt.isEmpty else{return}
    self.membershipRepository.addRule(query: txt) { model in
      self.tweetRule = model
    } failure: { error in
    self.errorWithDismissViewController(message: error.localizedDescription)
    }
    
  }
  
  func removeRule(rule:TweetRuleData, text:String){
    guard let id = rule.id else{return}
    membershipRepository.removeRule(query: id) { res in
      self.addRule(txt: text)
    } failure: { error in
      self.errorWithDismissViewController(message: error.localizedDescription)

    }

  }
  
  func getStream() {
    membershipRepository.getStream { model in
      self.tweets.value.insert(model.data, at: 0)
      self.tweets.send( self.tweets.value)
    } failure: {  error in
      self.errorWithDismissViewController(message: error.localizedDescription)
    }

  }
}

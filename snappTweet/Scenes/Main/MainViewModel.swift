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
    let searchText = CurrentValueSubject<String, Never>("ios developer")
    var subsciptions = Set<AnyCancellable>()
    let membershipRepository = MembershipRepository()
func search_query() {
    searchText
      .removeDuplicates()
      .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
      .receive(on: DispatchQueue.main)
      .filter({!$0.isEmpty})
      .sink { text in
        self.membershipRepository.getShareList(query: text) { model in
          self.tweets.send(model)
        } failure: { error in
          self.errorWithDismissViewController(message: error.localizedDescription)
        }

      }.store(in: &subsciptions)
}
  func showDetails(_ text: String) {
    (self.coordinator as? MainCoordinator)?.showShareList(text)
  }
}

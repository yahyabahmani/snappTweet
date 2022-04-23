//
//  DetailsTweetCoordinator.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import UIKit
final class DetailsTweetCoordinator: Coordinatable {
  var rootViewController: UIViewController
  init(text:String) {
      let vc = DetailsTweetViewController.instantiate()
      self.rootViewController = vc
      let viewModel = DetailsTweetViewModel(text: text)
      vc.viewModel = viewModel
  }
}

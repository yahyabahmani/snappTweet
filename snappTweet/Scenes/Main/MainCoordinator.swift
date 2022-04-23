//
//  MainCoordinator.swift
//  snappTweet
//
//  Created by yahya on 4/22/22.
//

import Foundation
import UIKit
final class MainCoordinator: Coordinatable {
    var rootViewController: UIViewController
    // var appWindow:UIWindow
      init(with _window: UIWindow) {
         // self.appWindow = window
          let nc = MainViewController.instantiateNC()
          let vc = nc.viewControllers.first as! MainViewController
          self.rootViewController = nc
          let viewModel = MainViewModel()
          vc.viewModel = viewModel
          viewModel.coordinator = self
          viewModel.delegate = vc
      }
  func showShareList(_ text: String) {
    DetailsTweetCoordinator.init(text: text).coordinate(to: rootViewController)
    //  ShareListViewCoordinator.init().coordinate(to: rootViewController)
  }
  
}

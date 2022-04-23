//
//  DetailsTweetViewController.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import UIKit

final class DetailsTweetViewController: UIViewController {
  var viewModel: DetailsTweetViewModel!
  @IBOutlet weak var textLabel: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()
        self.textLabel.text = self.viewModel.text
    }
}
extension DetailsTweetViewController: InstantiateViewControllerType {
  static var storyboardName: StoryBoardName {
    .detailsTweet
  }
}

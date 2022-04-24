//
//  MainTableViewCell.swift
//  snappTweet
//
//  Created by yahya on 4/22/22.
//

import UIKit

final class MainTableViewCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    }
  func fill(_ model: TweetModel) {
    self.titleLabel.text = model.text
  }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

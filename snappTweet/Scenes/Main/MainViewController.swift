//
//  MainViewController.swift
//  snappTweet
//
//  Created by yahya on 4/22/22.
//

import UIKit
import Combine

final class MainViewController: UIViewController {
  var viewModel: MainViewModel!
  let searchController = UISearchController(searchResultsController: nil)
  var subscriptions = Set<AnyCancellable>()
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupView()
    self.viewModel.getStream()

    self.setupSearchBarListeners()
    self.viewModel.search_query()
  }
  fileprivate func setupSearchBarListeners() {
    let publisher = NotificationCenter.default
      .publisher(for: UISearchTextField.textDidChangeNotification,
                 object: searchController.searchBar.searchTextField)
    publisher
      .compactMap {
        ($0.object as? UISearchTextField)?.text
      }
      .sink { [unowned self] (str) in
        self.viewModel.searchText.send(str)
      }.store(in: &subscriptions)

    self.viewModel.tweets.sink { [unowned self] (_) in
       self.tableView.reloadData()
      print(self.viewModel.tweets.value)
    }.store(in: &subscriptions)
  }
  func setupView() {
    self.tableView.registerCell(MainTableViewCell.nibName)
    navigationItem.searchController = searchController
    navigationItem.title = "Search Tweets"
    searchController.obscuresBackgroundDuringPresentation = false
  }
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.viewModel.tweets.value.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.nibName, for: indexPath) as! MainTableViewCell
    cell.fill(self.viewModel.tweets.value[indexPath.row])
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.viewModel.showDetails(self.viewModel.tweets.value[indexPath.row].text)
  }
}
extension MainViewController: InstantiateViewControllerType {
  static var storyboardName: StoryBoardName {
    .main
  }
}

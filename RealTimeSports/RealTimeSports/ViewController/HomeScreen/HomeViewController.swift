//
//  ViewController.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {

    private var viewModel = ViewModelFactory.makeLiveEventViewModel()
    private var timer: Timer?

    var errorView: ErrorView!
    var searchButton: UIButton!
    var liveEventsTableView: UITableView!

    var liveEvents: [LiveEvent] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupTableView()
        fetchAllLiveEvents()
        startRequestInterval()
    }

    @objc func searchButtonTapped() {
        let searchViewController = SearchViewController()
        present(searchViewController, animated: true)
    }

    deinit {
        stopRequestInterval()
    }

}

// MARK: Actions
extension HomeViewController {

    private func startRequestInterval() {
        timer = Timer.scheduledTimer(withTimeInterval: 5 * 60, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.fetchAllLiveEvents()
        }
    }

    private func stopRequestInterval() {
        timer?.invalidate()
        timer = nil
    }

    private func fetchAllLiveEvents() {
        viewModel.fetchAllLiveEvents { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let liveEvents):
                self.liveEvents = liveEvents
                self.liveEventsTableView.reloadData()
            case .failure(let error):
                self.errorView.setDescriptionLabel(error.userFriendlyDescription)
                self.errorView.isHidden = false
            }
        }
    }

}

// MARK: Table View
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    private func setupTableView() {
        liveEventsTableView.delegate = self
        liveEventsTableView.dataSource = self
        liveEventsTableView.register(LiveEventTableViewCell.self, forCellReuseIdentifier: LiveEventTableViewCell.cellIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        liveEvents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LiveEventTableViewCell.cellIdentifier,
            for: indexPath) as! LiveEventTableViewCell
        let liveEvent = liveEvents[indexPath.row]
        cell.set(liveEvent: liveEvent)
        cell.selectionStyle = .none

        return cell
    }




}

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

    private var liveEvents: [LiveEvent] = []
    private var eventsByLeague: [String: [LiveEvent]] = [:]
    private var leagues: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupTableView()
        fetchAllLiveEvents()
        startRequestInterval()
    }

    deinit {
        stopRequestInterval()
    }

}

// MARK: Actions
extension HomeViewController {

    @objc func searchButtonTapped() {
        let searchViewController = SearchViewController()
        present(searchViewController, animated: true)
    }

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
                self.groupEventsByLeague()
                self.liveEventsTableView.reloadData()
            case .failure(let error):
                self.errorView.setDescriptionLabel(error.userFriendlyDescription)
                self.errorView.isHidden = false
            }
        }
    }

    private func groupEventsByLeague() {
        for event in liveEvents {
            if eventsByLeague[event.league] != nil {
                eventsByLeague[event.league]?.append(event)
            } else {
                eventsByLeague[event.league] = [event]
                leagues.append(event.league)
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

    func numberOfSections(in tableView: UITableView) -> Int {
        leagues.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let league = leagues[section]
        return eventsByLeague[league]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LiveEventTableViewCell.cellIdentifier,
            for: indexPath) as! LiveEventTableViewCell
        let league = leagues[indexPath.section]

        guard let liveEvent = eventsByLeague[league]?[indexPath.row] else {
            return UITableViewCell()
        }

        cell.set(liveEvent: liveEvent)
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        leagues[section]
    }

}

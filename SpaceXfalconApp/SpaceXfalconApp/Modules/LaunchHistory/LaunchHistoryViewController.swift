//
//  LaunchHistoryViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 14.06.23.
//

import Foundation
import UIKit

class LaunchHistoryViewController: UIViewController {
    let launchHistoryView = LaunchHistoryView()
    let launchHistoryViewModel: LaunchHistoryViewModel
    
    init(launchHistoryViewModel: LaunchHistoryViewModel) {
        self.launchHistoryViewModel = launchHistoryViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupLaunchHistoryView()
        
        fetchLaunches()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupLaunchHistoryView() {
        view.addSubview(launchHistoryView)
        
        title = "Launch history"
        
        launchHistoryView.tableView.delegate = self
        launchHistoryView.tableView.dataSource = self
        
        launchHistoryView.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            maker.leading.trailing.equalToSuperview()
        }
    }
    
    func fetchLaunches() {
        launchHistoryViewModel.fetchLaunches { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.launchHistoryView.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch rockets: \(error)")
            }
        }
    }
}

extension LaunchHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { launchHistoryViewModel.launches.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LaunchHistoryAttributesItemCell.launchHistoryCellIdentifier, for: indexPath) as! LaunchHistoryAttributesItemCell
        if let launch = launchHistoryViewModel.rocketLaunchSafety(at: indexPath.row) {
            cell.update(withLaunch: launch)
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
}

extension LaunchHistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 116 }
}

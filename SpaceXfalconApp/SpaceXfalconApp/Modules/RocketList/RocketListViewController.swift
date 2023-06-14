//
//  RocketListViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 30.05.23.
//

import Foundation
import UIKit
import SnapKit

class RocketListViewController: UIViewController {
    
    let rocketListView = RocketListView()
    let rocketListViewModel = RocketListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rockets"
        rocketListView.tableView.dataSource = self
        rocketListView.tableView.delegate = self
        rocketListView.delegate = self
        setupRocketListView()
        
        fetchRockets()
    }
    
    func fetchRockets() {
        rocketListViewModel.fetchRockets { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.rocketListView.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch rockets: \(error)")
            }
        }
    }
    
    func setupRocketListView() {
        view.addSubview(rocketListView)
        
        rocketListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension RocketListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RocketListAttributesItemCell.rocketListCellIdentifier, for: indexPath) as! RocketListAttributesItemCell
        
        let rocket = rocketListViewModel.rocketSafety(at: indexPath.row)
        cell.textLabel?.text = rocket?.rocketName
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketListViewModel.rockets.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRocket(atIndex: indexPath.row)
    }
}

extension RocketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

extension RocketListViewController: RocketListViewDelegate {
    func didSelectRocket(atIndex index: Int) {
        guard let rocket = rocketListViewModel.rocketSafety(at: index) else { return }
        let rocketViewModel = RocketViewModel(rocket: rocket)
        let rocketViewController = RocketViewController(viewModel: rocketViewModel)
        self.navigationController?.pushViewController(rocketViewController, animated: true)
    }
}

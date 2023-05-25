//
//  ViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit
import Kingfisher

class RocketViewController: UIViewController {
    
    let firstSectionTitles = ["Первый запуск", "Страна", "Стоимость запуска", ""]
    let secondSectionTitles = ["Количество двигателей", "Количество топлива", "Время сгорания", ""]
    let thirdSectionTitles = ["Количество двигателей", "Количество топлива", "Время сгорания"]
    
    let rocketView = RocketView()
    let rocketViewModel = RocketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rocketView.delegate = self
        rocketView.tableView.dataSource = self
        setupRocketView()
        
        fetchRockets()
        
    }
    
    func setupRocketView() {
        view.addSubview(rocketView)
        
        rocketView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func fetchRockets() {
        rocketViewModel.fetchRockets { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.rocketView.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch rockets: \(error)")
            }
        }
    }
}

extension RocketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else if section == 1 {
            return 5
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RocketAttributeItemCell.rocketCellIdentifier, for: indexPath) as! RocketAttributeItemCell
              
        if indexPath.section == 0 {
            cell.update(cellType: .item,
                        title: firstSectionTitles[indexPath.row],
                        value: getSectionValue(for: indexPath))
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ПЕРВАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: getSectionValue(for: indexPath))
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ВТОРАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: getSectionValue(for: indexPath))
            }
        }
        return cell
    }
    
    func getSectionValue(for indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0:
            let rocket = rocketViewModel.getRocketSafety(at: 0)
            switch indexPath.row {
            case 0:
                return rocket?.rocketFirstFlight.formatFirstFlightDate() ?? ""
            case 1:
                return rocket?.rocketLaunchCountry ?? ""
            case 2:
                return String(rocket?.costPerLaunch ?? 0)
            default:
                return ""
            }
        case 1:
            let rocket = rocketViewModel.getRocketSafety(at: 0)
            switch indexPath.row {
            case 1:
                return String(rocket?.firstStage.rocketEngines ?? 0)
            case 2:
                return String(rocket?.firstStage.rocketFuelAmount ?? 0)
            case 3:
                return String(rocket?.firstStage.rocketBurnTime ?? 0)
            default:
                return ""
            }
        case 2:
            let rocket = rocketViewModel.getRocketSafety(at: 0)
            switch indexPath.row {
            case 1:
                return String(rocket?.secondStage.rocketEngines ?? 0)
            case 2:
                return String(rocket?.secondStage.rocketFuelAmount ?? 0)
            case 3:
                return String(rocket?.secondStage.rocketBurnTime ?? 0)
            default:
                return ""
            }
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension RocketViewController: RocketViewDelegate {
    
    func didTapHistoryButton() {
    }
    func didTapSettingsButton() {
    }
}

//
//  RocketViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit
import Kingfisher

protocol RocketViewControllerDelegate {
    func updateMode(forSetting: Setting)
}

class RocketViewController: UIViewController {
    let firstSectionTitles = ["Первый запуск", "Страна", "Стоимость запуска", ""]
    let secondSectionTitles = ["Количество двигателей", "Количество топлива", "Время сгорания", ""]
    let thirdSectionTitles = ["Количество двигателей", "Количество топлива", "Время сгорания"]
    
    let rocketView = RocketView()
    let viewModel: RocketViewModel
    
    init(viewModel: RocketViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        rocketView.delegate = self
        rocketView.tableView.dataSource = self
        rocketView.collectionView.dataSource = self
        rocketView.collectionView.delegate = self
        setupRocketView()
        rocketView.update(withRocket: viewModel.rocket)
    }
    
    func setupRocketView() {
        view.addSubview(rocketView)
        
        rocketView.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            maker.leading.trailing.equalToSuperview()
        }
        
        title = viewModel.rocket.rocketName
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
                        value: viewModel.tableViewSectionValue(for: indexPath))
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ПЕРВАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: viewModel.tableViewSectionValue(for: indexPath))
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ВТОРАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: viewModel.tableViewSectionValue(for: indexPath))
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension RocketViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketParameterItemCell.rocketParameterIdentifier, for: indexPath) as! RocketParameterItemCell
        var setting: Setting = .height
        var mode: Mode = .m
        switch indexPath.item {
        case 0:
            setting = .height
            mode = viewModel.getMode(forSetting: setting) ?? .m
        case 1:
            setting = .diameter
            mode = viewModel.getMode(forSetting: setting) ?? .m
        case 2:
            setting = .mass
            mode = viewModel.getMode(forSetting: setting) ?? .kg
        case 3:
            setting = .thrust
            mode = viewModel.getMode(forSetting: setting) ?? .kN
        default:
            break
        }
        let value = viewModel.collectionViewItemValue(for: indexPath, mode: mode)
        cell.update(value: value, setting: setting, mode: mode)
        return cell
    }
}

extension RocketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 96)
    }
}

extension RocketViewController: RocketViewDelegate {
    func didTapLaunchHistoryButton() {
        let viewModel = LaunchHistoryViewModel()
        let viewController = LaunchHistoryViewController(launchHistoryViewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didTapSettingsButton() {
        let viewModel = SettingsViewModel()
        let viewController = SettingsViewController(viewModel: viewModel, rocketViewControllerDelegate: self)
        navigationController?.present(viewController, animated: true)
    }
}

extension RocketViewController: RocketViewControllerDelegate {
    func updateMode(forSetting setting: Setting) {
        rocketView.collectionView.reloadData()
    }
}

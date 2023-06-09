//
//  RocketViewController.swift
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
        
        rocketView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
                        value: viewModel.getTableViewSectionValue(for: indexPath))
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ПЕРВАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: viewModel.getTableViewSectionValue(for: indexPath))
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ВТОРАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: viewModel.getTableViewSectionValue(for: indexPath))
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
        var measureSystem: RocketViewModel.MeasureSystem = .feet
        switch indexPath.item {
        case 0:
            measureSystem = .meter
        case 1:
            measureSystem = .meter
        case 2:
            measureSystem = .kg
        case 3:
            measureSystem = .kN
        default:
            break
        }
        let value = viewModel.getCollectionViewItemValue(for: indexPath, measureSystem: measureSystem)
        cell.update(value: value, index: indexPath.item)
        return cell
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 60.0
//      }
    }

extension RocketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 96)
    }
}

extension RocketViewController: RocketViewDelegate {
    func didTapHistoryButton() {
    }
    
    func didTapSettingsButton() {
    }
}

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
    let rocketViewModel: RocketViewModel
    
    init(viewModel: RocketViewModel) {
        self.rocketViewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        rocketView.delegate = self
        rocketView.tableView.delegate = self
        rocketView.tableView.dataSource = self
        setupRocketView()
        rocketView.update(withRocket: rocketViewModel.rocket)
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
                        value: rocketViewModel.getSectionValue(for: indexPath))
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ПЕРВАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: rocketViewModel.getSectionValue(for: indexPath))
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ВТОРАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: rocketViewModel.getSectionValue(for: indexPath))
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}


extension RocketViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        rocketView.updateShadowVisibility(withContentOffsetY: scrollView.contentOffset.y)
    }
}

extension RocketViewController: RocketViewDelegate {
    func didTapHistoryButton() {
    }
    
    func didTapSettingsButton() {
    }
}

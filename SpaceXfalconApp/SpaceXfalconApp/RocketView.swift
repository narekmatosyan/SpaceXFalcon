//
//  CustomView.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit

protocol RocketViewDelegate {
    func didTapHistoryButton()
    func didTapSettingsButton()
}

class RocketView: UIView {
    var delegate: RocketViewDelegate?
    
    let firstSectionTitles = ["Первый запуск", "Страна", "Стоимость запуска", ""]
    let secondSectionTitles = ["Количество двигателей", "Количество топлива", "Время сгорания", ""]
    let thirdSectionTitles = ["Количество двигателей", "Количество топлива", "Время сгорания"]
    let firstSectionValues = ["7 февраля,2018", "США", "$90 млн", ""]
    let secondSectionValues = ["27", "308,6", "593", ""]
    let thirdSectionValues = ["1", "243,2","397"]
    
    let rocketImageView = UIImageView()
    let settingsButton = UIButton()
    let launchHistoryButton = UIButton()
    let rocketNameLabel = UILabel()
    let tableView = UITableView()
    let blackView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        setupRocketImageView()
        setupBlackView()
        setupRocketNameLabel()
        setupSettingsButton()
        setupTableView()
        setupLaunchHistoryButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupRocketImageView() {
        addSubview(rocketImageView)
        
        rocketImageView.image = UIImage(named: "BackgroundPic")
        rocketImageView.layer.cornerRadius = 10
        
        rocketImageView.snp.makeConstraints { maker in
            maker.width.equalTo(400)
            maker.height.equalTo(627)
        }
    }
    
    func setupBlackView() {
        addSubview(blackView)
        
        blackView.layer.cornerRadius = 32
        blackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blackView.backgroundColor = .black
        
        blackView.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.leading.trailing.equalToSuperview()
            maker.top.equalToSuperview().offset(310)
        }
    }
    
    func setupRocketNameLabel() {
        blackView.addSubview(rocketNameLabel)
        
        rocketNameLabel.textAlignment = .center
        rocketNameLabel.text = "Falcon Heavy"
        rocketNameLabel.textColor = .white
        rocketNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        rocketNameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(48)
            maker.leading.equalToSuperview().inset(32)
        }
    }
    
    func setupSettingsButton() {
        blackView.addSubview(settingsButton)
        
        settingsButton.setImage(UIImage(named: "Setting"), for: .normal)
        
        settingsButton.snp.makeConstraints { maker in
            maker.width.height.equalTo(32)
            maker.trailing.equalToSuperview().inset(32)
            maker.top.equalToSuperview().offset(48)
        }
    }
    
    func setupTableView() {
        blackView.addSubview(tableView)
        
        tableView.register(RocketAttributeItemCell.self, forCellReuseIdentifier: RocketAttributeItemCell.rocketCellIdentifier)
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 50
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        
        tableView.snp.makeConstraints { maker in
            maker.width.equalTo(bounds.width - 32 * 2)
            maker.leading.equalToSuperview().offset(32)
            maker.trailing.equalToSuperview().inset(32)
            maker.top.equalTo(rocketNameLabel.snp.bottom).offset(40)
        }
    }
    
    func setupLaunchHistoryButton() {
        blackView.addSubview(launchHistoryButton)
        
        launchHistoryButton.layer.cornerRadius = 16
        launchHistoryButton.backgroundColor = .rocketGray
        launchHistoryButton.setTitle( "Посмотреть запуски", for: .normal)
        launchHistoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        launchHistoryButton.snp.makeConstraints { maker in
            maker.height.equalTo(60)
            maker.leading.equalToSuperview().offset(32)
            maker.trailing.equalToSuperview().inset(32)
            maker.top.equalTo(tableView.snp.bottom).offset(16)
            maker.bottom.equalToSuperview().inset(40)
        }
    }
}

extension RocketView: UITableViewDataSource {
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
        cell.selectionStyle = .none
        if indexPath.section == 0 {
            cell.update(cellType: .item,
                        title: firstSectionTitles[indexPath.row],
                        value: firstSectionValues[indexPath.row])
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ПЕРВАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: secondSectionValues[indexPath.row - 1])
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.update(cellType: .header, title: "ВТОРАЯ СТУПЕНЬ")
            } else {
                cell.update(cellType: .item,
                            title: secondSectionTitles[indexPath.row - 1],
                            value: thirdSectionValues[indexPath.row - 1])
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

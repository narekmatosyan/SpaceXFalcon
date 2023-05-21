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

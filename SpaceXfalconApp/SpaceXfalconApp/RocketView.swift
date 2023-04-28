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
    let scrollView = UIScrollView()
    let settingsButton = UIButton()
    let launchHistoryButton = UIButton()
    let rocketNameLabel = UILabel()
    let blackView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        setupRocketImageView()
        setupBlackView()
        setupRocketNameLabel()
        setupLaunchHistoryButton()
        setupSettingsButton()
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupRocketImageView() {
        scrollView.addSubview(rocketImageView)
        rocketImageView.image = UIImage(named: "BackgroundPic")
        rocketImageView.layer.cornerRadius = 10
        rocketImageView.snp.makeConstraints { maker in
            maker.width.equalTo(400)
            maker.height.equalTo(627)
        }
    }
    
    func setupBlackView() {
        blackView.layer.cornerRadius = 32
        blackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blackView.backgroundColor = .black
        scrollView.addSubview(blackView)
        let height = UIScreen.main.bounds.size.height
        blackView.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(height - 300)
            maker.bottom.equalToSuperview()
            maker.top.equalToSuperview().offset(300)
        }
    }
    
    func setupRocketNameLabel() {
        rocketNameLabel.textAlignment = .center
        rocketNameLabel.text = "Falcon Heavy"
        rocketNameLabel.textColor = .white
        rocketNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        blackView.addSubview(rocketNameLabel)
        rocketNameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(48)
            maker.leading.equalToSuperview().inset(32)
        }
    }
    
    func setupSettingsButton() {
        settingsButton.setImage(UIImage(named: "Setting"), for: .normal)
        blackView.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { maker in
            maker.width.height.equalTo(32)
            maker.trailing.equalToSuperview().inset(32)
            maker.top.equalToSuperview().offset(48)
        }
    }
    
    func setupLaunchHistoryButton() {
        launchHistoryButton.layer.cornerRadius = 20
        launchHistoryButton.backgroundColor = UIColor.rocketGray //rocket gray
        launchHistoryButton.setTitle( "Посмотреть запуски", for: .normal)
        launchHistoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        blackView.addSubview(launchHistoryButton)
        launchHistoryButton.snp.makeConstraints { maker in
            maker.height.equalTo(60)
            maker.top.equalTo(rocketNameLabel.snp.bottom).offset(16)
            maker.leading.equalToSuperview().offset(32)
            maker.trailing.equalToSuperview().inset(32)
        }
    }
}

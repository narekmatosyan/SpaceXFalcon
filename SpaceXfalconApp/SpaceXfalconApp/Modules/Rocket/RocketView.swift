//
//  RocketView.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit
import Kingfisher

protocol RocketViewDelegate {
    func didTapLaunchHistoryButton()
    func didTapSettingsButton()
}

class RocketView: UIView {
    var delegate: RocketViewDelegate?
    
    let settingsButton = UIButton()
    let launchHistoryButton = UIButton()
    let rocketNameLabel = UILabel()
    let tableView = UITableView()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(RocketParameterItemCell.self, forCellWithReuseIdentifier: RocketParameterItemCell.rocketParameterIdentifier)
        return collectionView
    }()
    
    let blackView = UIView()
    let rocketImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        
        setupRocketImageView()
        setupBlackView()
        setupRocketNameLabel()
        setupSettingsButton()
        setupCollectionView()
        setupTableView()
        setupLaunchHistoryButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupRocketImageView() {
        addSubview(rocketImageView)
        
        rocketImageView.snp.makeConstraints { maker in
            maker.top.width.equalToSuperview()
            maker.centerX.equalToSuperview()
            maker.height.equalTo(400)
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
            maker.top.equalToSuperview().offset(200)
        }
    }
    
    func setupRocketNameLabel() {
        blackView.addSubview(rocketNameLabel)
        
        rocketNameLabel.textAlignment = .center
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
            maker.top.equalToSuperview().offset(44)
        }
    }
    
    func setupCollectionView() {
        blackView.addSubview(collectionView)
        
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.snp.makeConstraints { maker in
            maker.height.equalTo(96)
            maker.leading.trailing.equalTo(32)
            maker.top.equalTo(rocketNameLabel.snp.bottom).offset(32)
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
            maker.top.equalTo(collectionView.snp.bottom).offset(40)
        }
    }
    
    func setupLaunchHistoryButton() {
        blackView.addSubview(launchHistoryButton)
        
        launchHistoryButton.layer.cornerRadius = 16
        launchHistoryButton.backgroundColor = .rocketGray
        launchHistoryButton.setTitle( "История запусков всех ракет", for: .normal)
        launchHistoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        launchHistoryButton.addTarget(self, action: #selector(didLaunchHistoryButtonTapped), for: .touchUpInside)
        
        launchHistoryButton.snp.makeConstraints { maker in
            maker.height.equalTo(60)
            maker.leading.equalToSuperview().offset(32)
            maker.trailing.equalToSuperview().inset(32)
            maker.top.equalTo(tableView.snp.bottom).offset(16)
            maker.bottom.equalToSuperview().inset(40)
        }
    }
    
    func update(withRocket rocket: RocketModel) {
        let imageUrl = rocket.flickrImages.first ?? ""
        let url = URL(string: imageUrl)
        rocketImageView.kf.setImage(with: url)
        rocketNameLabel.text = rocket.rocketName
    }
    
    @objc func didLaunchHistoryButtonTapped(_ sender: UIButton) {
        delegate?.didTapLaunchHistoryButton()
    }
}

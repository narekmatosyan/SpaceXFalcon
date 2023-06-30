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
            maker.height.equalTo(Constants.rocketImageViewHeight)
        }
    }
    
    func setupBlackView() {
        addSubview(blackView)
        
        blackView.layer.cornerRadius = Constants.BlackView.cornerRadius
        blackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blackView.backgroundColor = .black
        
        blackView.snp.makeConstraints { maker in
            maker.width.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.leading.trailing.equalToSuperview()
            maker.top.equalToSuperview().offset(Constants.BlackView.topOffset)
        }
    }
    
    func setupRocketNameLabel() {
        blackView.addSubview(rocketNameLabel)
        
        rocketNameLabel.textAlignment = .center
        rocketNameLabel.textColor = .white
        rocketNameLabel.font = UIFont.boldSystemFont(ofSize: Constants.RocketNameLabel.titleLabelFontSize)
        
        rocketNameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(Constants.RocketNameLabel.topOffset)
            maker.leading.equalToSuperview().inset(Constants.RocketNameLabel.leadingInset)
        }
    }
    
    func setupSettingsButton() {
        blackView.addSubview(settingsButton)
        
        settingsButton.setImage(UIImage(named: "Setting"), for: .normal)
        settingsButton.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        settingsButton.snp.makeConstraints { maker in
            maker.width.height.equalTo(Constants.SettingsButton.side)
            maker.trailing.equalToSuperview().inset(Constants.SettingsButton.trailingInset)
            maker.top.equalToSuperview().offset(Constants.SettingsButton.topOffset)
        }
    }
    
    func setupCollectionView() {
        blackView.addSubview(collectionView)
        
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset.left = Constants.CollectionView.contentInsetLeft
        collectionView.snp.makeConstraints { maker in
            maker.height.equalTo(Constants.CollectionView.height)
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(rocketNameLabel.snp.bottom).offset(Constants.CollectionView.topOffset)
        }
    }
    
    func setupTableView() {
        blackView.addSubview(tableView)
        
        tableView.register(RocketAttributeItemCell.self, forCellReuseIdentifier: RocketAttributeItemCell.rocketCellIdentifier)
        tableView.sectionHeaderHeight = Constants.TableView.sectionHeaderHeight
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        tableView.snp.makeConstraints { maker in
            maker.width.equalTo(bounds.width - 32 * 2)
            maker.leading.equalToSuperview().offset(Constants.TableView.leadingOffset)
            maker.trailing.equalToSuperview().inset(Constants.TableView.trailingInset)
            maker.top.equalTo(collectionView.snp.bottom).offset(Constants.TableView.topOffset)
        }
    }
    
    func setupLaunchHistoryButton() {
        blackView.addSubview(launchHistoryButton)
        
        launchHistoryButton.layer.cornerRadius = Constants.LaunchHistoryButton.cornerRadius
        launchHistoryButton.backgroundColor = .rocketGray
        launchHistoryButton.setTitle( "История запусков всех ракет", for: .normal)
        launchHistoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.LaunchHistoryButton.titleLabelFont)
        launchHistoryButton.addTarget(self, action: #selector(didLaunchHistoryButtonTapped), for: .touchUpInside)
        
        launchHistoryButton.snp.makeConstraints { maker in
            maker.height.equalTo(Constants.LaunchHistoryButton.height)
            maker.leading.equalToSuperview().offset(Constants.LaunchHistoryButton.leadingOffset)
            maker.trailing.equalToSuperview().inset(Constants.LaunchHistoryButton.trailingInset)
            maker.top.equalTo(tableView.snp.bottom).offset(Constants.LaunchHistoryButton.topOffset)
            maker.bottom.equalToSuperview().inset(Constants.LaunchHistoryButton.bottomInset)
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
    
    @objc func didTapSettingsButton(_ sender: UIButton) {
        delegate?.didTapSettingsButton()
    }
}
extension RocketView {
    enum Constants {
        static let rocketImageViewHeight: CGFloat = 400
        
        enum BlackView {
            static let cornerRadius: CGFloat = 32
            static let topOffset: CGFloat = 200
        }
        
        enum RocketNameLabel {
            static let topOffset: CGFloat = 48
            static let leadingInset: CGFloat = 32
            static let titleLabelFontSize: CGFloat = 24
        }
        
        enum SettingsButton {
            static let side: CGFloat = 32
            static let trailingInset: CGFloat = 32
            static let topOffset: CGFloat = 44
        }
        
        enum CollectionView {
            static let contentInsetLeft: CGFloat = 32
            static let height: CGFloat = 96
            static let topOffset: CGFloat = 32
        }
        
        enum TableView {
            static let sectionHeaderHeight: CGFloat = 50
            static let leadingOffset: CGFloat = 32
            static let trailingInset: CGFloat = 32
            static let topOffset: CGFloat = 40
        }
        
        enum LaunchHistoryButton {
            static let cornerRadius: CGFloat = 16
            static let titleLabelFont: CGFloat = 20
            static let height: CGFloat = 60
            static let leadingOffset: CGFloat = 32
            static let trailingInset: CGFloat = 32
            static let topOffset: CGFloat = 16
            static let bottomInset: CGFloat = 40
        }
    }
}

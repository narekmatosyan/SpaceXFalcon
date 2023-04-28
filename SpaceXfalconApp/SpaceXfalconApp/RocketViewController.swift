//
//  ViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit

class RocketViewController: UIViewController {
    let rocketImageView = UIImageView()
    let scrollView = UIScrollView()
    let settingsIconButton = UIButton()
    let launchStoryButton = UIButton()
    let rocketNameLabel = UILabel()
    let blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRocketImageView()
        setupBlackView()
        setupRocketNameLabel()
        setupLaunchStoryButton()
        setupSettingsIcon()
        setupScrollView()
        
    }
        
        func setupScrollView() {
            view.addSubview(scrollView)
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
            blackView.snp.makeConstraints{ maker in
                maker.width.equalTo(400)
                maker.height.equalTo(250)
                maker.bottom.equalTo(rocketImageView)
            }
        }
        
        func setupRocketNameLabel() {
            rocketNameLabel.textAlignment = .center
            rocketNameLabel.text = "Falcon Heavy"
            rocketNameLabel.textColor = .white
            rocketNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
            blackView.addSubview(rocketNameLabel)
            rocketNameLabel.snp.makeConstraints { maker in
                maker.width.equalTo(150)
                maker.height.equalTo(90)
                maker.leading.equalTo(20)
            }
        }
        
        func setupSettingsIcon() {
            settingsIconButton.setImage(UIImage(named: "Setting"), for: .normal)
            scrollView.addSubview(blackView)
            blackView.addSubview(settingsIconButton)
            settingsIconButton.snp.makeConstraints { maker in
                maker.height.equalTo(90)
                maker.width.equalTo(150)
                maker.trailing.equalTo(20)
                maker.top.equalTo(2)
            }
        }
        
        func setupLaunchStoryButton() {
            launchStoryButton.layer.cornerRadius = 20
            launchStoryButton.backgroundColor = UIColor(hexString: "#212121") //rocket gray
            launchStoryButton.setTitle( "Посмотреть запуски", for: .normal)
            launchStoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            blackView.addSubview(launchStoryButton)
            launchStoryButton.snp.makeConstraints { maker in
                maker.width.equalTo(320)
                maker.height.equalTo(60)
                maker.top.equalTo(90)
                maker.leading.equalTo(32)
                
            }
        }
    }

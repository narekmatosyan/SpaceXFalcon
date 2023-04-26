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
    let lauchStoryButton = UIButton()
    let rocketNameLabel = UILabel()
    var blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRocketImageView()
        setupBlackView()
        setupRocketNameLabel()
        setupLaunchStoryButton()
        setupSettingsIcon()
        setupScrollView()
        
        
        func setupScrollView() {
            view.addSubview(scrollView)
            scrollView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        
        func setupRocketImageView() {
            scrollView.addSubview(rocketImageView)
            //CONSTR
            rocketImageView.image = UIImage(named: "BackgroundPic")
            rocketImageView.layer.cornerRadius = 10
            rocketImageView.snp.makeConstraints { maker in
                //maker.center.equalToSuperview()
                maker.width.equalTo(400)
                maker.height.equalTo(627)
            }
        }
        
        func setupBlackView() {
            // CONSTR
            blackView.layer.cornerRadius = 32
            blackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            blackView.backgroundColor = UIColor.black
            scrollView.addSubview(blackView)
            //blackView.snp.bottom.equalsTo(blackView)
            blackView.snp.makeConstraints{ maker in
                maker.width.equalTo(400)
                maker.height.equalTo(250)
                maker.bottom.equalTo(rocketImageView)
                
                
            }
        }
        //let label = UILabel(frame: CGRect(x: 60, y: 296, width: 200, height: 70))
        func setupRocketNameLabel() {
            // CONSTR
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
            settingsIconButton.setImage(UIImage(named:"Setting"), for: .normal)
            scrollView.addSubview(blackView)
            self.blackView.addSubview(settingsIconButton)
            settingsIconButton.snp.makeConstraints { maker in
                maker.height.equalTo(90)
                maker.width.equalTo(150)
                maker.trailing.equalTo(20)
            }
        }
        
        func setupLaunchStoryButton() {
            lauchStoryButton.layer.cornerRadius = 20
            lauchStoryButton.backgroundColor = UIColor(hexString: "#212121")
            lauchStoryButton.setTitle( "Посмотреть запуски", for: .normal)
            lauchStoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            blackView.addSubview(lauchStoryButton)
            lauchStoryButton.snp.makeConstraints { maker in
                maker.width.equalTo(320)
                maker.height.equalTo(60)
                maker.top.equalTo(90)
                maker.leading.equalTo(32)
            }
        }
    }
}

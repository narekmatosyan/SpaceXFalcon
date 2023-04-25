//
//  ViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit

class RocketViewController: UIViewController {
    let rocketImgView = UIImageView()
    let scrollView = UIScrollView()
    let settingsIcon = UIImageView()
    let lauchStoryButton = UIButton()
    let rocketNameLabel = UILabel()
    var blackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupRocketImageView() {
            scrollView.addSubview(rocketImgView)
            rocketImgView.frame = CGRect(x: 0, y: 0, width: 400, height: 627)
            rocketImgView.image = UIImage(named: "BackgroundPic")
            rocketImgView.layer.cornerRadius = 10
        }
        
        func setupBlackView() {
            blackView = UIView(frame: CGRect(x: 0, y: 310, width: view.bounds.size.width, height: view.bounds.size.height))
            blackView.layer.cornerRadius = 32
            blackView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            blackView.backgroundColor = UIColor.black
            view.addSubview(blackView) }
        
        //let label = UILabel(frame: CGRect(x: 60, y: 296, width: 200, height: 70))
        func setupRocketNameLabel() {
            rocketNameLabel.center = CGPoint(x: 95, y: 370)
            rocketNameLabel.textAlignment = .center
            rocketNameLabel.text = "Falcon Heavy"
            rocketNameLabel.textColor = .white
            rocketNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
            view.addSubview(rocketNameLabel)
            self.view.addSubview(rocketNameLabel)
        }
        
        func setupSettingsIcon() {
            settingsIcon.frame = CGRect(x: 320, y: 355, width: 32, height: 32)
            settingsIcon.image = UIImage(named: "Setting")
            view.addSubview(blackView)
            self.view.addSubview(settingsIcon)}
        
        func setupLaunchStoryButton() {
            lauchStoryButton.frame = CGRect(x: 11, y: 420, width: 367, height: 60)
            lauchStoryButton.layer.cornerRadius = 20
            lauchStoryButton.backgroundColor = UIColor(hexString: "#212121")
            lauchStoryButton.setTitle( "Посмотреть запуски", for: .normal)
            lauchStoryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            view.addSubview(lauchStoryButton)
        }
    }
}
/*extension UIImageView {
 func imgViewCorners() {
 layer.cornerRadius = 10
 layer.borderWidth = 1.0
 layer.masksToBounds = true}}*/

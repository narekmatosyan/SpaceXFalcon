//
//  ViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let imgView = UIImageView()
    let scrollView = UIScrollView()
    let settingsIcon = UIImageView()
    let button = UIButton()
    var blackSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imgView)
        imgView.frame = CGRect(x: 0, y: 0, width: 400, height: 627)
        imgView.image = UIImage(named: "BackgroundPic")
        imgView.imgViewCorners()
        view.addSubview(imgView)
        
        //scrollView.addSubview(blackSquare)
        blackSquare = UIView(frame: CGRect(x: 0, y: 310, width: view.bounds.size.width, height: view.bounds.size.height))
        blackSquare.backgroundColor = .red
        blackSquare.layer.cornerRadius = 32
        blackSquare.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        blackSquare.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.addSubview(blackSquare)
        blackSquare.backgroundColor = UIColor.black
        view.addSubview(blackSquare)
        
        let label = UILabel(frame: CGRect(x: 60, y: 296, width: 200, height: 70))
        label.center = CGPoint(x: 95, y: 370)
        label.textAlignment = .center
        label.text = "Falcon Heavy"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        settingsIcon.frame = CGRect(x: 320, y: 355, width: 32, height: 32)
        settingsIcon.image = UIImage(named: "Setting")
        view.addSubview(blackSquare)
        self.view.addSubview(label)
        self.view.addSubview(settingsIcon)
        
        button.frame = CGRect(x: 11, y: 420, width: 367, height: 60)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(hexString: "#212121")
        button.setTitle( "Посмотреть запуски", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(button)
    }
}

extension UIImageView {
    
    func imgViewCorners() {
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.masksToBounds = true
    }
}

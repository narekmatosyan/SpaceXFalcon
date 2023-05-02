//
//  ViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 18.04.23.
//

import UIKit
import SnapKit

class RocketViewController: UIViewController {
    let rocketView = RocketView()
    let rocketViewModel = RocketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rocketView.delegate = self
        setupRocketView()
        
    }
    
    func setupRocketView() {
        view.addSubview(rocketView)
        
        rocketView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
extension RocketViewController: RocketViewDelegate {
    func didTapHistoryButton() {
        
    }
    
    func didTapSettingsButton() {
        
    }
}
                               

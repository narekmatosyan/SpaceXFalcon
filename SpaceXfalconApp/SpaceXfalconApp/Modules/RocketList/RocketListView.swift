//
//  RocketListView.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 30.05.23.
//

import UIKit
import SnapKit
import Kingfisher

protocol RocketListViewDelegate {
    func didSelectRocket(atIndex index: Int)
}

class RocketListView: UIView {
    var delegate: RocketListViewDelegate?
    
    let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        addSubview(tableView)
        
        tableView.register(RocketListAttributesItemCell.self, forCellReuseIdentifier: RocketListAttributesItemCell.rocketListCellIdentifier)
        tableView.sectionHeaderHeight = 50
        tableView.layer.cornerRadius = 24
        tableView.backgroundColor = .systemMint
        tableView.showsVerticalScrollIndicator = false
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(safeAreaInsets.top)
            maker.leading.trailing.bottom.equalToSuperview()
        }
    }
}

//
//  LaunchHistoryView.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 14.06.23.
//

import UIKit
import SnapKit
import Foundation

class LaunchHistoryView: UIView {
    let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .black
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        addSubview(tableView)
        
        tableView.register(LaunchHistoryAttributesItemCell.self, forCellReuseIdentifier: LaunchHistoryAttributesItemCell.launchHistoryCellIdentifier)
        tableView.sectionHeaderHeight = TableView.sectionHeader
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        tableView.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview()
            maker.leading.equalToSuperview().offset(TableView.leadingOffset)
            maker.trailing.equalToSuperview().inset(TableView.trailingInset)
        }
    }
}

extension LaunchHistoryView {
    enum TableView {
        static let sectionHeader: CGFloat = 50
        static let leadingOffset: CGFloat = 32
        static let trailingInset: CGFloat = 32
    }
}

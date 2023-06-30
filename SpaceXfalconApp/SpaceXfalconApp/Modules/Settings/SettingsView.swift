//
//  SettingsView.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 21.06.23.
//

import Foundation
import UIKit
import SnapKit

protocol SettingsViewDelegate {
    func didClosedButtonTapped()
}

class SettingsView: UIView {
    var delegate: SettingsViewDelegate?
    
    let tableView = UITableView()
    let titleLabel = UILabel()
    let closeButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
        
        setupTitleLabel()
        setupTableView()
        setupCloseButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.text = Constants.TitleLabel.TitleLabelHeaderText
        titleLabel.textColor = .specWhite
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(Constants.topOffset)
            maker.centerX.equalToSuperview()
        }
    }
    
    func setupTableView() {
        addSubview(tableView)
        
        tableView.register(SettingsItemCell.self, forCellReuseIdentifier: SettingsItemCell.settingsCellIdentifier)
        tableView.sectionHeaderHeight = Constants.TableView.sectionHeaderHeight
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        tableView.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.top.equalTo(titleLabel.snp.bottom).offset(Constants.TableView.topOffset)
        }
    }
    
    func setupCloseButton() {
        addSubview(closeButton)
        
        closeButton.setTitle(Constants.CloseButton.closeButtonTitle, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.snp.makeConstraints { maker in
            maker.trailing.equalToSuperview().inset(Constants.CloseButton.trailingInset)
            maker.top.equalToSuperview().offset(Constants.CloseButton.topOffset)
            maker.width.equalTo(Constants.CloseButton.width)
            maker.height.equalTo(Constants.CloseButton.height)
        }
    }
    
    @objc func closeButtonTapped() {
        delegate?.didClosedButtonTapped()
    }
}

extension SettingsView {
    enum Constants {
        static let topOffset: CGFloat = 18
        
        enum TableView {
            static let sectionHeaderHeight: CGFloat = 50
            static let topOffset: CGFloat = 72
        }
        
        enum CloseButton {
            static let trailingInset: CGFloat = 25
            static let topOffset: CGFloat = 18
            static let width: CGFloat = 71
            static let height: CGFloat = 22
            static let closeButtonTitle: String = "Закрыть"
        }
        
        enum TitleLabel {
            static let TitleLabelHeaderText: String = "Настройки"
        }
    }
}

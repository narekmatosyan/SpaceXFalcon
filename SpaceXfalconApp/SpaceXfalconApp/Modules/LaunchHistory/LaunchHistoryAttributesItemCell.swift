//
//  LaunchHistoryAttributesItemCell.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 14.06.23.
//

import Foundation
import UIKit

class LaunchHistoryAttributesItemCell: UITableViewCell {
    static let launchHistoryCellIdentifier = "LaunchHistoryAttributesItemCellIdentifier"
    
    let dateLabel = UILabel()
    let titleLabel = UILabel()
    let launchStateImageView = UIImageView()
    let labelsStackView = UIStackView()
    let containerView = UIView()
        
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 24
        backgroundColor = .black
        textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel?.textColor = .lightGray
        textLabel?.textAlignment = .center
        selectionStyle = .none
        
        setupContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContainerView() {
        contentView.addSubview(containerView)
        
        containerView.backgroundColor = .rocketGray
        containerView.layer.cornerRadius = 24
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        setupLabelsStackView()
        setupLaunchStateImageView()
    }
    
    func setupLabelsStackView() {
        containerView.addSubview(labelsStackView)
        
        labelsStackView.axis = .vertical
        
        labelsStackView.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalToSuperview().offset(24)
        }
        
        setupTitleLabel()
        setupDateLabel()
        setupLaunchStateImageView()
    }
    
    func setupTitleLabel() {
        labelsStackView.addArrangedSubview(titleLabel)
        
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .specWhite
        
        titleLabel.snp.makeConstraints { maker in
            maker.width.equalTo(200)
        }
    }
    
    func setupDateLabel() {
        labelsStackView.addArrangedSubview(dateLabel)
        dateLabel.textColor = .darkGray
    }
    
    func setupLaunchStateImageView() {
        containerView.addSubview(launchStateImageView)
        
        launchStateImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(32)
            make.width.height.equalTo(32)
            make.centerY.equalToSuperview()
        }
            
    }
    
    func update(withLaunch launch: LaunchModel) {
        titleLabel.text = launch.name
        dateLabel.text = launch.date.formatLaunchHistoryDate()
        
        guard let isSuccess = launch.isSuccess else { return }
        launchStateImageView.image = isSuccess ? UIImage(named: "launchSuccess") : UIImage(named: "launchFailure")
    }
}

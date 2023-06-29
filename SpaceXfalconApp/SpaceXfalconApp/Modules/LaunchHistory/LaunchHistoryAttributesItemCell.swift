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
        contentView.layer.cornerRadius = Constants.layer
        backgroundColor = .black
        textLabel?.font = UIFont.boldSystemFont(ofSize: Constants.textLabelFont)
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
        containerView.layer.cornerRadius = Constants.ContainerView.layerCornerRadius
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(Constants.ContainerView.topOffset)
            make.bottom.equalToSuperview().inset(Constants.ContainerView.bottomInset)
        }
        
        setupLabelsStackView()
        setupLaunchStateImageView()
    }
    
    func setupLabelsStackView() {
        containerView.addSubview(labelsStackView)
        
        labelsStackView.axis = .vertical
        
        labelsStackView.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalToSuperview().offset(Constants.LabelsStackView.leadongOffset)
        }
        
        setupTitleLabel()
        setupDateLabel()
        setupLaunchStateImageView()
    }
    
    func setupTitleLabel() {
        labelsStackView.addArrangedSubview(titleLabel)
        
        titleLabel.numberOfLines = Int(Constants.TitleLabel.numberOfLines)
        titleLabel.textColor = .specWhite
        
        titleLabel.snp.makeConstraints { maker in
            maker.width.equalTo(Constants.TitleLabel.width)
        }
    }
    
    func setupDateLabel() {
        labelsStackView.addArrangedSubview(dateLabel)
        dateLabel.textColor = .darkGray
    }
    
    func setupLaunchStateImageView() {
        containerView.addSubview(launchStateImageView)
        
        launchStateImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Constants.LauchStateImageView.trailingInset)
            make.width.height.equalTo(Constants.LauchStateImageView.width)
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

extension LaunchHistoryAttributesItemCell {
    enum Constants {
        static let layer: CGFloat = 24
        static let textLabelFont: CGFloat = 20
        
        enum ContainerView {
            static let layerCornerRadius: CGFloat = 24
            static let topOffset: CGFloat = 8
            static let bottomInset: CGFloat = 8
        }
        enum LabelsStackView {
            static let leadongOffset: CGFloat = 24
        }
        enum TitleLabel {
            static let numberOfLines: CGFloat = 0
            static let width: CGFloat = 200
        }
        enum LauchStateImageView {
            static let trailingInset: CGFloat = 32
            static let width: CGFloat = 32
        }
    }
}

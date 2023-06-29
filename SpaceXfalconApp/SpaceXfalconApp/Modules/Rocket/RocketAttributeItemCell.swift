//
//  RocketAttributeItemCell.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 02.05.23.
//

import UIKit

class RocketAttributeItemCell: UITableViewCell {
    enum CellType {
        case header
        case item
    }
    
    static let rocketCellIdentifier = "RocketAttributesItemCellIdentifier"
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        
        selectionStyle = .none
        
        setupTitleLabel()
        setupValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .lightGray
        titleLabel.font = UIFont(name: "LabGrotesque-Regular", size: Constants.titleLabelFont)
        titleLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalToSuperview()
        }
    }
    
    func setupValueLabel() {
        contentView.addSubview(valueLabel)
        valueLabel.textColor = .specWhite
        valueLabel.font = UIFont(name: "LabGrotesque-Regular", size: Constants.ValueLabel.valueLabelFont)
        valueLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
    }
    
    func update(cellType: CellType, title: String, value: String? = nil) {
        switch cellType {
        case .header:
            titleLabel.font = UIFont(name: "LabGrotesque-Bold", size: Constants.Update.titleLabelFont)
            titleLabel.textColor = .specWhite
        case .item:
            break
        }
        titleLabel.text = title
        valueLabel.text = value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.font = UIFont(name: "LabGrotesque-Regular", size: Constants.PrepareForReuse.titleLabelFont)
    }
}

extension RocketAttributeItemCell {
    enum Constants {
        static let titleLabelFont: CGFloat = 16
        
        enum ValueLabel {
            static let valueLabelFont: CGFloat = 16
        }
        enum Update {
            static let titleLabelFont: CGFloat = 16
        }
        enum PrepareForReuse {
            static let titleLabelFont: CGFloat = 16
        }
    }
}

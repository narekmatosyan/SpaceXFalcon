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
        titleLabel.font = UIFont(name: "LabGrotesque-Regular", size: TitleLabel.titleLabelFontSize)
        titleLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalToSuperview()
        }
    }
    
    func setupValueLabel() {
        contentView.addSubview(valueLabel)
        valueLabel.textColor = .specWhite
        valueLabel.font = UIFont(name: "LabGrotesque-Regular", size: ValueLabel.valueLabelFontSize)
        valueLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
    }
    
    func update(cellType: CellType, title: String, value: String? = nil) {
        switch cellType {
        case .header:
            titleLabel.font = UIFont(name: "LabGrotesque-Bold", size: Constants.titleLabelFontSize)
            titleLabel.textColor = .specWhite
        case .item:
            break
        }
        titleLabel.text = title
        valueLabel.text = value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.font = UIFont(name: "LabGrotesque-Regular", size: TitleLabelFontSize.titleLabelFontSize)
    }
}

extension RocketAttributeItemCell {
    
    enum TitleLabel {
        static let titleLabelFontSize: CGFloat = 16
    }
    
    enum ValueLabel {
        static let valueLabelFontSize: CGFloat = 16
    }
    
    enum Constants {
        static let titleLabelFontSize: CGFloat = 16
    }
    
    enum TitleLabelFontSize {
        static let titleLabelFontSize: CGFloat = 16
    }
}

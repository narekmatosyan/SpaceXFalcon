//
//  RocketParameterItemCell.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 08.06.23.
//

import UIKit
import SnapKit

class RocketParameterItemCell: UICollectionViewCell {
    static let rocketParameterIdentifier = "RocketParameterItemCellIdentifier"
    
    let valueLabel = UILabel()
    let titleLabel = UILabel()
    let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = .rocketGray
        
        setupContainerView()
    }
    
    func setupContainerView() {
        addSubview(containerView)
        
        containerView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        
        setupValueLabel()
        setupTitleLabel()
    }
    
    func setupValueLabel() {
        containerView.addSubview(valueLabel)
        
        valueLabel.textColor = .white
        valueLabel.font = UIFont(name: "LabGrotesque-Bold", size: Constants.ValueLabel.labelFontSize)
        valueLabel.textAlignment = .center
        valueLabel.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
        }
    }
    
    func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.textColor = .darkGray
        titleLabel.font = UIFont(name: "LabGrotesque-Regular", size: Constants.TitleLabel.titleFontSize)
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.top.equalTo(valueLabel.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(value: Double, setting: Setting, mode: Mode) {
        valueLabel.text = String(value)
        if setting == .thrust {
            titleLabel.text = Constants.TitleLabel.titleText + ", \(mode.rawValue)"
        } else {
            titleLabel.text = setting.rawValue + ", \(mode.rawValue)"
        }
    }
}
extension RocketParameterItemCell {
    enum Constants {
        static let cornerRadius: CGFloat = 32
        
        enum ValueLabel {
            static let labelFontSize: CGFloat = 16
        }
        
        enum TitleLabel {
            static let titleFontSize: CGFloat = 14
            static let titleText: String = "Нагрузка"
        }
    }
}

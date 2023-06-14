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
    
    let titles = ["Высота, m", "Диаметр, m", "Масса, kg", "Нагрузка, kg"]
    
    let valueLabel = UILabel()
    let titleLabel = UILabel()
    let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 32
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
        valueLabel.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        valueLabel.textAlignment = .center
        valueLabel.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
        }
    }
    
    func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.textColor = .darkGray
        titleLabel.font = UIFont(name: "LabGrotesque-Regular", size: 14)
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.top.equalTo(valueLabel.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(value: Double, index: Int) {
        if index == 2 || index == 3 {
            valueLabel.text = String(Int(value))
        } else {
            valueLabel.text = String(value)
        }
        titleLabel.text = titles[index]
    }
}

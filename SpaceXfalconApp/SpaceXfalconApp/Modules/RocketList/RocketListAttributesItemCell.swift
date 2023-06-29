//
//  RocketListAttributesCell.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 02.06.23.
//

import UIKit

class RocketListAttributesItemCell: UITableViewCell {
    static let rocketListCellIdentifier = "RocketListAttributesItemCellIdentifier"
        
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
        contentView.layer.borderWidth = Constants.layerBorderWidth
        contentView.layer.borderColor = UIColor.rocketGray.cgColor
        textLabel?.font = UIFont.boldSystemFont(ofSize: Constants.textLabelFont)
        textLabel?.textColor = .gray
        textLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension RocketListAttributesItemCell {
    enum Constants {
        static let layerBorderWidth: CGFloat = 4
        static let textLabelFont: CGFloat = 26
    }
}

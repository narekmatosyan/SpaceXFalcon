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
        contentView.layer.borderWidth = 4
        contentView.layer.borderColor = UIColor.systemMint.cgColor
        textLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        textLabel?.textColor = .systemMint
        textLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

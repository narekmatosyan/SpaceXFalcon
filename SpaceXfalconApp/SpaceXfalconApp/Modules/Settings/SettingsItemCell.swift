//
//  SettingsItemCell.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 21.06.23.
//

import Foundation
import UIKit

enum Mode: String {
    case m
    case ft
    case kg
    case lb
    case kN
    case lbf
}

enum ModeViewModel {
    case mFt
    case kgLb
    case knLbf
}

protocol SettingsItemCellDelegate {
    func didSegmentedControlTapped(withSetting setting: Setting, mode: Mode)
}

class SettingsItemCell: UITableViewCell {
    static let settingsCellIdentifier = "SettingsItemCellIdentifier"
    
    var delegate: SettingsItemCellDelegate?
    
    let segmentedControl = UISegmentedControl(items: ["", ""])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
        textLabel?.font = UIFont.systemFont(ofSize: Constants.textLabelFontSize)
        textLabel?.textColor = .specWhite
        
        setupSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSegmentedControl() {
        addSubview(segmentedControl)
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .rocketGray
        segmentedControl.selectedSegmentTintColor = .specWhite
        segmentedControl.tintColor = .lightGray
        segmentedControl.snp.makeConstraints { maker in
            maker.trailing.equalToSuperview().inset(Constants.SegmentedControl.trailingInset)
            maker.centerY.equalToSuperview()
            maker.width.equalTo(Constants.SegmentedControl.width)
            maker.height.equalTo(Constants.SegmentedControl.height)
        }
    }
    
    @objc func segmentedControlTapped() {
        guard let title = textLabel?.text,
              let setting = Setting(rawValue: title) else { return }
        
        var mode: Mode
        switch setting {
        case .height:
            mode = segmentedControl.selectedSegmentIndex == 0 ? .m : .ft
        case .diameter:
            mode = segmentedControl.selectedSegmentIndex == 0 ? .m : .ft
        case .mass:
            mode = segmentedControl.selectedSegmentIndex == 0 ? .kg : .lb
        case .thrust:
            mode = segmentedControl.selectedSegmentIndex == 0 ? .kg : .lb
        }
        
        _ = segmentedControl.selectedSegmentIndex
        delegate?.didSegmentedControlTapped(withSetting: setting, mode: mode)
    }
    
    func update(modeViewModel: ModeViewModel,
                selectedSegmentIndex: Int,
                title: String) {
        textLabel?.text = title
        switch modeViewModel {
        case .mFt:
            segmentedControl.setTitle(Mode.m.rawValue, forSegmentAt: 0)
            segmentedControl.setTitle(Mode.ft.rawValue, forSegmentAt: 1)
        case .kgLb:
            segmentedControl.setTitle(Mode.kg.rawValue, forSegmentAt: 0)
            segmentedControl.setTitle(Mode.lb.rawValue, forSegmentAt: 1)
        case .knLbf:
            segmentedControl.setTitle(Mode.kN.rawValue, forSegmentAt: 0)
            segmentedControl.setTitle(Mode.lbf.rawValue, forSegmentAt: 1)
        }
        segmentedControl.selectedSegmentIndex = selectedSegmentIndex
    }
}

extension SettingsItemCell {
    enum Constants {
        static let textLabelFontSize: CGFloat = 18
        
        enum SegmentedControl {
            static let trailingInset: CGFloat = 28
            static let width: CGFloat = 115
            static let height: CGFloat = 40
        }
    }
}

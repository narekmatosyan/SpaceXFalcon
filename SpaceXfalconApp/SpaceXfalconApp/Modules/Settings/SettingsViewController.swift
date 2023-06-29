//
//  SettingsViewController.swift
//  SpaceXfalconApp
//
//  Created by Narek Matosyan on 21.06.23.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    let settingsView = SettingsView()
    var viewModel: SettingsViewModel
    let closeButton = UIButton(type: .system)
    var rocketViewControllerDelegate: RocketViewControllerDelegate
    
    init(viewModel: SettingsViewModel, rocketViewControllerDelegate: RocketViewControllerDelegate) {
        self.viewModel = viewModel
        self.rocketViewControllerDelegate = rocketViewControllerDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        
        settingsView.delegate = self
        settingsView.tableView.dataSource = self
        settingsView.tableView.delegate = self
        setupSettingsView()
    }
    
    func setupSettingsView() {
        view.addSubview(settingsView)
        
        settingsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsItemCell.settingsCellIdentifier, for: indexPath) as! SettingsItemCell
        cell.delegate = self
        switch indexPath.row {
        case 0:
            let mode = viewModel.getMode(forSetting: .height) ?? .m
            let selectedSegmentIndex = mode == .m ? 0 : 1
            cell.update(modeViewModel: .mFt, selectedSegmentIndex: selectedSegmentIndex, title: Setting.height.rawValue)
        case 1:
            let mode = viewModel.getMode(forSetting: .diameter) ?? .m
            let selectedSegmentIndex = mode == .m ? 0 : 1
            cell.update(modeViewModel: .mFt, selectedSegmentIndex: selectedSegmentIndex, title: Setting.diameter.rawValue)
        case 2:
            let mode = viewModel.getMode(forSetting: .mass) ?? .kg
            let selectedSegmentIndex = mode == .kg ? 0 : 1
            cell.update(modeViewModel: .kgLb, selectedSegmentIndex: selectedSegmentIndex, title: Setting.mass.rawValue)
        case 3:
            let mode = viewModel.getMode(forSetting: .thrust) ?? .kN
            let selectedSegmentIndex = mode == .kN ? 0 : 1
            cell.update(modeViewModel: .knLbf, selectedSegmentIndex: selectedSegmentIndex, title: Setting.thrust.rawValue)
        default:
            break
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }
}

extension SettingsViewController: SettingsViewDelegate {
    func didClosedButtonTapped() {
        dismiss(animated: true)
    }
}

extension SettingsViewController: SettingsItemCellDelegate {
    func didSegmentedControlTapped(withSetting setting: Setting, mode: Mode) {
        viewModel.saveMode(forSetting: setting, mode: mode)
        rocketViewControllerDelegate.updateMode(forSetting: setting)
    }
}

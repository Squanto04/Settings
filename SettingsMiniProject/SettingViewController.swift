//
//  SettingViewController.swift
//  Settings
//
//  Created by Jordan Lamb on 9/23/19.
//  Copyright © 2019 James Pacheco. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
} // End of Class

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.shared.mySettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as? SettingTableViewCell
        let setting = SettingsController.shared.mySettings[indexPath.row]
        cell?.setting = setting
        
        // Step 5 of 5
        /// Assigns the SettingTableViewCell's property of delegate equal to the SettingViewController. The SettingViewController can now handle the SettingTableViewCellDelegate protocol methods.
        /// - Requires: Class conformance to the protocol.
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }
} // End of Extension

// Step 4 of 5 - Conformance to the protocol

extension SettingViewController: SettingTableViewCellDelegate {
    /**
     Conformance to the protocol stub
     
     - Note:
     The SettingViewController is conforming to the SettingTableViewCellDelegate protocol. The Class is required to handle the protocol methods. When the method is called, perform the required tasks.
     */
    func settingValueChanged(_ cell: SettingTableViewCell, selected: Bool) {
        guard let setting = cell.setting else { return }
        setting.isSet = selected
        cell.updateView()
    }
    
    
} // End of Extension

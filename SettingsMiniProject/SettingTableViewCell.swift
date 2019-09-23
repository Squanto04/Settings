//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Jordan Lamb on 9/23/19.
//  Copyright © 2019 James Pacheco. All rights reserved.
//

import UIKit

/// Step 1 of 5 : Define Protocol
/**
 Definition of the SettingTableViewDelegate protocol that only classes can conform to.
 
 - Note:
 A class that conforms to this protocol you must implement the settingValueChanged(_ cell:selected:) method.
 Where this is named SettingTableViewCellDelegate, it is not a delegate, this is just proper naming convention. The class that conforms to this protocol is the delegate.
 */
protocol SettingTableViewCellDelegate: class {
    func settingValueChanged(_ cell: SettingTableViewCell, selected: Bool)
}

class SettingTableViewCell: UITableViewCell {

    var setting: Setting? {
        didSet {
            updateView()
        }
    }
    
    /// Step 2 of 5
    /**
     Declatation of the delegate variable that will be a class that conforms to the protocol SettingTableViewCellDelegate.
     
     - Note:
     We declare the delegate and mark it optional similarly to how we declare a landing pad. This variable will be set where and when we need it to be. It is marked weak for memory management purposes.
     */
    weak var delegate: SettingTableViewCellDelegate?

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!

    /// Step 3 of 5
    /**
     Call the delegate to perform the SettingTableViewCellDelegate method.
     - Parameters:
        - sender: The Switch that is tied to this action.
     
     - Note:
     When this action is fired, it will tell the delegate to perform the settingValueChanged(_ cell:,selected:) passing in self (refering to the UITableViewCell) for the cell parameter, and the current value of the settingSwitch outlet for the selected parameter.
     */
    @IBAction func settingSwitchValueChanged(_ sender: Any) {
        delegate?.settingValueChanged(self, selected: settingSwitch.isOn)
    }

    func updateView() {
        guard let setting = setting else {return}
        iconImageView.image = setting.image
        settingNameLabel.text = setting.name
        settingSwitch.isOn = setting.isSet
        self.backgroundColor = setting.isSet ? .yellow : .white
    }
}

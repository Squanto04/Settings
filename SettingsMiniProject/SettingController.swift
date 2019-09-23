//
//  SettingController.swift
//  Settings
//
//  Created by Jordan Lamb on 9/23/19.
//  Copyright © 2019 James Pacheco. All rights reserved.
//

import UIKit

class SettingsController {
    
    /// Declares a static constant named shared and assigns it to an initialized instance of the SettingsController class.
    static let shared = SettingsController()
    
    /// Source of Truth array of setting objects
    var mySettings: [Setting]
    
    /**
     Initializes an instance of the SettingController class. Takes no parameters, and assigns the mySettings property to the mock data provided (music, apps, books).
     */
    init() {
        let music = Setting(name: "Music", image: UIImage(named: "music"))
        let apps = Setting(name: "Apps", image: UIImage(named: "apps"))
        let books = Setting(name: "Books", image: UIImage(named: "books"), isSet: true)
        
        self.mySettings = [music, apps, books]
    }
}

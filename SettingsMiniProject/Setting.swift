//
//  Setting.swift
//  Settings
//
//  Created by Jordan Lamb on 9/23/19.
//  Copyright © 2019 James Pacheco. All rights reserved.
//

import UIKit

/// Custom Setting model object
class Setting {
    /// The String value of the Setting's name
    let name: String
    /// UIImage of the Setting Object
    var image: UIImage?
    /// Boolean value of the current Setting's state
    var isSet: Bool
    
    /**
     Initalizes a Setting object from the given parameters
     
     - Parameters:
        - name: The String value of the Setting's name
        - image: UIImage of the Setting Object
        - isSet: Boolean value of the current Setting's state, sets default value to false.
     */
    init(name: String, image: UIImage?, isSet: Bool = false) {
        self.name = name
        self.image = image
        self.isSet = isSet
    }
}

//
//  SettingsManager.swift
//  Race
//
//  Created by Robert Kotrutsa on 13.02.2024.
//

import Foundation

class SettingsManager {
    
    static var shared = SettingsManager()
    
    private init() { }
    
    var settings: [Setting] = [Setting(settingName: "Sound", switchValue: true)]
    
}

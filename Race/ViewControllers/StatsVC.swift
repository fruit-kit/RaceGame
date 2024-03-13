//
//  StatsVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 15.02.2024.
//

import UIKit

class StatsVC: UIViewController {
    
    private let backgroundManager = BackgroundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundManager.setupBackgroundImage(self.view, backgroundImage: "bg-menu")
    }

}

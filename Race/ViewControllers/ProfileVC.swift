//
//  ProfileVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 13.02.2024.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {

        setupTitle()
        
        super.viewDidLoad()
    }

    // MARK: - Private Methods
    
    private func setupTitle() {
        
        self.title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

//
//  ViewController.swift
//  Race
//
//  Created by Robert Kotrutsa on 07.02.2024.
//

import UIKit

class MenuVC: UIViewController {

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
    }

    // MARK: - Private Methods
    
    private func setupTitle() {
        
        self.title = "Race"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}


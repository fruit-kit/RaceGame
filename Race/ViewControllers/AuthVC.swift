//
//  LoginVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 11.03.2024.
//

import UIKit

class AuthVC: UIViewController {

    @IBOutlet weak var authTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAuthTitleLabel()
    }
    
    private func setupAuthTitleLabel() {
        
        self.authTitleLabel.text = "Authorization"
        
        self.authTitleLabel.font = .boldSystemFont(ofSize: 30)
    }

}

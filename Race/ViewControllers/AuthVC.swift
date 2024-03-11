//
//  LoginVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 11.03.2024.
//

import UIKit

class AuthVC: UIViewController {

    @IBOutlet weak var authTitleLabel: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var secondNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAuthTitleLabel()
        
        setupTextFields()
    }
    
    private func setupAuthTitleLabel() {
        
        self.authTitleLabel.text = "Authorization"
        
        self.authTitleLabel.font = .boldSystemFont(ofSize: 30)
    }
    
    private func setupTextFields() {
        
        self.firstNameTextField.placeholder = "First name"
        
        self.secondNameTextField.placeholder = "Second name"
    }

}

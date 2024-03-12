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
    
    private var username = "user"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAuthTitleLabel()
        
        setupTextFields()
        
        self.firstNameTextField.delegate = self
        
        self.secondNameTextField.delegate = self
    }
    
    private func setupAuthTitleLabel() {
        
        self.authTitleLabel.text = "Authorization"
        
        self.authTitleLabel.font = .boldSystemFont(ofSize: 30)
    }
    
    private func setupTextFields() {
        
        self.firstNameTextField.placeholder = "First name"
        
        self.firstNameTextField.keyboardType = .alphabet
        
        self.secondNameTextField.placeholder = "Second name"
        
        self.secondNameTextField.keyboardType = .alphabet
    }

}

extension AuthVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.firstNameTextField {
            self.secondNameTextField.becomeFirstResponder()
        } else if textField == self.secondNameTextField {
            self.secondNameTextField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.firstNameTextField {
            self.username = (textField.text ?? "user") + " "
        } else if textField == self.secondNameTextField {
            self.username += (textField.text ?? "")
        }
        
        NotificationCenter.default.post(
            name: NSNotification.Name("updateUsername"),
            object: nil,
            userInfo: ["username" : self.username]
        )
    }
    
}

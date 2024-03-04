//
//  ProfileVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 13.02.2024.
//

import UIKit
import Lottie

class ProfileVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupLottieAnimation()
        
        setupTitle()
        
        setupGreetingsLabel()
        
        setupBackgroundImage()
    }
    
    // MARK: - Actions
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: "Log in with your username", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            
            self.greetingsLabel.text = "Hello, \(alert.textFields?.first?.text ?? "Hello,  Player")!"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { textField in
            textField.placeholder = "Username"
        }
        
        alert.addAction(okAction)
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupGreetingsLabel() {
        
        self.greetingsLabel.text = "Hello, Player!"
        
        self.greetingsLabel.font = .boldSystemFont(ofSize: 30)
        
        self.greetingsLabel.textColor = .white
    }
    
    private func setupLottieAnimation() {
        
            self.animationView.contentMode = .scaleAspectFit
            
            self.animationView.loopMode = .loop
            
            self.animationView.animationSpeed = 0.5
            
            self.animationView.play()
    }
    
    private func setupTitle() {
        
        self.title = "Profile"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupBackgroundImage() {
        
        guard let backgroundImage = UIImage(named: "bg-profile") else { return }
        
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        backgroundImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.frame = self.view.bounds
        
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(backgroundImageView)
        
        self.view.sendSubviewToBack(backgroundImageView)
    }
    
}

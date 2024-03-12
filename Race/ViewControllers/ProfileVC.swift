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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateUsername(_:)),
            name: NSNotification.Name("updateUsername"),
            object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateUsername(_ notification: Notification) {
        
        if let username = notification.userInfo?["username"] {
            self.greetingsLabel.text = "Hello, \(username)!"
        }
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

//
//  ProfileVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 13.02.2024.
//

import UIKit

import Lottie

class ProfileVC: UIViewController {
    
    // MARK: - Properties
    
    private let backgroundManager = BackgroundManager()
    
    // MARK: - Outlets
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupLottieAnimation()
        
        setupTitle()
        
        setupGreetingsLabel()
        
        self.backgroundManager.setupBackgroundImage(self.view, backgroundImage: "bg-profile")
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
        
        if let cusstomFont = UIFont(name: "ArturitoSlab-Bold", size: CGFloat(30)) {
            
            self.greetingsLabel.font = cusstomFont
            
        } else {
            
            fatalError("""
                    Failed to load the "CustomFont-Light" font.
                    Make sure the font file is included in the project and the font name is spelled correctly.
                    """
                )
            
        }
        
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
    
}

//
//  ProfileVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 13.02.2024.
//

import UIKit

class ProfileVC: UIViewController {

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {

        setupTitle()
        
        setupBackgroundImage()
        
        super.viewDidLoad()
    }

    // MARK: - Private Methods
    
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

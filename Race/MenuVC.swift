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
        setupBackgroundImage()
    }

    // MARK: - Private Methods
    
    private func setupTitle() {
        
        self.title = "Race"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupBackgroundImage() {
        
        guard let backgroundImage = UIImage(named: "backgroundImageMenuVC") else { return }
        
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
    }
    
}


//
//  ViewController.swift
//  Race
//
//  Created by Robert Kotrutsa on 07.02.2024.
//

import UIKit

class MenuVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        setupTitle()
        
        setupBackgroundImage()
        
        setupStartButton()
        
        super.viewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func setupTitle() {
        
        self.title = "Menu"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupBackgroundImage() {
        
        guard let backgroundImage = UIImage(named: "bg-menu") else { return }
        
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
    }
    
    private func setupStartButton() {
        
        self.startButton.layer.cornerRadius = 5
    }
    
}


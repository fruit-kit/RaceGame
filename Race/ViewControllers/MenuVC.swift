//
//  ViewController.swift
//  Race
//
//  Created by Robert Kotrutsa on 07.02.2024.
//

import UIKit

class MenuVC: UIViewController {
    
    private let backgroundManager = BackgroundManager()
    
    // MARK: - Outlets
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitle()
        
        self.backgroundManager.setupBackgroundImage(self.view, backgroundImage: "bg-menu")
        
        setupStartButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        startButtonAnimation()
    }
    
    // MARK: - Private Methods
    
    private func setupTitle() {
        
        self.title = "Menu"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupStartButton() {
        
        self.startButton.layer.cornerRadius = 5
    }
    
    private func startButtonAnimation() {
        
        UIView.animate(withDuration: 0.7, delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: { [weak self] in
            self?.startButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { [weak self] _ in
            self?.startButton.transform = .identity
        }
    }
    
}



//
//  StatsVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 15.02.2024.
//

import UIKit

class StatsVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupBlurEffectToBackground()
    }
    
    private func setupBlurEffectToBackground() {
        
        let blureEffect = UIBlurEffect(style: .light)
        
        let bluredEffectView = UIVisualEffectView(effect: blureEffect)
        
        bluredEffectView.frame = self.view.bounds
        
        bluredEffectView.alpha = 1
        
        bluredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(bluredEffectView)
    }
    
}

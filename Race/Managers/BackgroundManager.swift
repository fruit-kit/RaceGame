//
//  BackgroundManager.swift
//  Race
//
//  Created by Robert Kotrutsa on 12.03.2024.
//

import UIKit

class BackgroundManager {
    
    func setupBackgroundImage(_ view: UIView, backgroundImage: String) {
        
        guard let backgroundImage = UIImage(named: backgroundImage) else { return }
        
        let backgroundImageView = UIImageView(image: backgroundImage)
        
        backgroundImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.frame = view.bounds
        
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(backgroundImageView)
        
        view.sendSubviewToBack(backgroundImageView)
    }
    
}

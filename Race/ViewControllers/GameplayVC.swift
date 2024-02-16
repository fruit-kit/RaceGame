//
//  GameplayVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 16.02.2024.
//

import UIKit

class GameplayVC: UIViewController {
    
    // MARK: - Properties
    
    private let car = UIImageView(image: UIImage(named: "car"))
    
    private let rock = UIImageView(image: UIImage(named: "rock"))
    
    private let tree = UIImageView(image: UIImage(named: "tree"))
    
    private let barrier = UIImageView(image: UIImage(named: "barrier"))
    
    private var leftOriginCoordinate: CGFloat = 0
    
    private var centerOriginCoordinate: CGFloat = 0
    
    private var rightOriginCoordinate: CGFloat = 0
    
    private var elementSize: CGFloat = 0
    
    private let defaultPadding: CGFloat = 20

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        self.car.contentMode = .scaleAspectFit
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupCoordinates()
        
        setupFrames()
        
        super.viewWillAppear(animated)
    }
    
    private func setupCoordinates() {
        
        let screenWidth = self.view.frame.width
        
        self.elementSize = screenWidth / 4
        
        self.leftOriginCoordinate = self.elementSize / 4
        
        self.centerOriginCoordinate =  (self.leftOriginCoordinate * 2) + self.elementSize
        
        self.rightOriginCoordinate = (self.elementSize * 2) + (leftOriginCoordinate * 3)
    }
    
    private func setupFrames() {
        
        let screenHeight = self.view.frame.height
        
        let bottomSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? defaultPadding
        
        let yCarCoordinate = screenHeight - bottomSafeAreaPadding - elementSize
        
        self.car.frame = CGRect(x: self.centerOriginCoordinate,
                                y: yCarCoordinate,
                                width: self.elementSize,
                                height: self.elementSize)
        
        self.view.addSubview(self.car)
    }

}

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
    
    private let defaultPadding: CGFloat = 100

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        self.car.contentMode = .scaleAspectFit
        self.tree.contentMode = .scaleAspectFit
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupCoordinates()
        
        setupFrames()
        
        super.viewWillAppear(animated)
    }
    
    @IBAction func PositionSegmentControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.car.frame.origin.x = self.leftOriginCoordinate
        case 1:
            self.car.frame.origin.x = self.centerOriginCoordinate
        case 2:
            self.car.frame.origin.x = self.rightOriginCoordinate
        default:
            break
        }
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
        
        let topSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        
        let bottomSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        
        // MARK: - Car
        
        let yCarCoordinateOfCar = screenHeight - bottomSafeAreaPadding - self.elementSize - self.defaultPadding
        
        self.car.frame = CGRect(x: self.centerOriginCoordinate,
                                y: yCarCoordinateOfCar,
                                width: self.elementSize,
                                height: self.elementSize)
        
        self.view.addSubview(self.car)
        
        // MARK: - Tree
        
        let yCarCoordinateOfTree = (topSafeAreaPadding + navigationBarHeight) * 3
        
        self.tree.frame = CGRect(x: self.leftOriginCoordinate,
                                y: yCarCoordinateOfTree,
                                width: self.elementSize,
                                height: self.elementSize)
        
        self.view.addSubview(self.tree)
        
        // MARK: - Barrier
        
        let yCarCoordinateOfBarrier = (topSafeAreaPadding + navigationBarHeight) * 2
        
        self.barrier.frame = CGRect(x: self.centerOriginCoordinate,
                                y: yCarCoordinateOfBarrier,
                                width: self.elementSize,
                                height: self.elementSize)
        
        self.view.addSubview(self.barrier)
        
        // MARK: - Rock
        
        let yCarCoordinateOfRock = (topSafeAreaPadding + navigationBarHeight)
        
        self.rock.frame = CGRect(x: self.rightOriginCoordinate,
                                y: yCarCoordinateOfRock,
                                width: self.elementSize,
                                height: self.elementSize)
        
        self.view.addSubview(self.rock)
    }

}

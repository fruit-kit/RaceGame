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
    
    private enum ElementPosition {
        
        case left, center, right
    }

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.car.contentMode = .scaleAspectFit
        self.tree.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupCoordinates()
        
        setupFrames()
        
        addSubviews()
    }
    
    @IBAction func PositionSegmentControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            moveCar(to: .left)
        case 1:
            moveCar(to: .center)
        case 2:
            moveCar(to: .right)
        default:
            break
        }
    }
    
    // MARK: - Private Methods
    
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
        
        let yCoordinateOfCar = screenHeight - bottomSafeAreaPadding - self.elementSize - self.defaultPadding
        
        self.car.frame = CGRect(x: self.centerOriginCoordinate,
                                y: yCoordinateOfCar,
                                width: self.elementSize,
                                height: self.elementSize)
        
        // MARK: - Tree
        
        let yCoordinateOfTree = (topSafeAreaPadding + navigationBarHeight) * 3
        
        self.tree.frame = CGRect(x: self.leftOriginCoordinate,
                                y: yCoordinateOfTree,
                                width: self.elementSize,
                                height: self.elementSize)
        
        // MARK: - Barrier
        
        let yCoordinateOfBarrier = (topSafeAreaPadding + navigationBarHeight) * 2
        
        self.barrier.frame = CGRect(x: self.centerOriginCoordinate,
                                y: yCoordinateOfBarrier,
                                width: self.elementSize,
                                height: self.elementSize)
        
        // MARK: - Rock
        
        let yCoordinateOfRock = (topSafeAreaPadding + navigationBarHeight)
        
        self.rock.frame = CGRect(x: self.rightOriginCoordinate,
                                y: yCoordinateOfRock,
                                width: self.elementSize,
                                height: self.elementSize)
    }
    
    private func addSubviews() {
        
        self.view.addSubview(self.car)
        self.view.addSubview(self.tree)
        self.view.addSubview(self.barrier)
        self.view.addSubview(self.rock)
    }
    
    private func moveCar(to position: ElementPosition) {
        
        switch position {
        case .left:
            self.car.frame.origin.x = self.leftOriginCoordinate
        case .center:
            self.car.frame.origin.x = self.centerOriginCoordinate
        case .right:
            self.car.frame.origin.x = self.rightOriginCoordinate
        }
    }

}

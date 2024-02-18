//
//  GameplayVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 16.02.2024.
//

import UIKit

class GameplayVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var car: UIImageView = {
        return UIImageView(image: UIImage(named: "car"))
    }()
    
    private lazy var rock: UIImageView = {
        return UIImageView(image: UIImage(named: "rock"))
    }()
    
    private lazy var tree: UIImageView = {
        return UIImageView(image: UIImage(named: "tree"))
    }()
    
    private lazy var barrier: UIImageView = {
        return UIImageView(image: UIImage(named: "barrier"))
    }()
    
    private lazy var road: UIImageView = {
        return UIImageView(image: UIImage(named: "road"))
    }()
    
    private var leftOriginCoordinate: CGFloat = 0
    
    private var centerOriginCoordinate: CGFloat = 0
    
    private var rightOriginCoordinate: CGFloat = 0
    
    private var elementSize: CGFloat = 0
    
    private let defaultPadding: CGFloat = 100
    
    var screenHeight: CGFloat = 0
    
    var screenWidth: CGFloat = 0
    
    let topSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    
    let bottomSafeAreaPadding = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    
    var navigationBarHeight: CGFloat = 0
    
    private enum ElementPosition {
        
        case left, center, right
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.road.contentMode = .scaleAspectFit
        
        self.car.contentMode = .scaleAspectFit
        
        self.tree.contentMode = .scaleAspectFit
        
        self.barrier.contentMode = .scaleAspectFit
        
        self.rock.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupCoordinates()
        
        setupFrames()
        
        addSubviews()
    }
    
    // MARK: - Actions
    
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
        
        self.screenWidth = self.view.frame.width
        
        self.screenHeight = self.view.frame.height
        
        self.navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0
        
        self.elementSize = self.screenWidth / 4
        
        self.leftOriginCoordinate = self.elementSize / 4
        
        self.centerOriginCoordinate =  (self.leftOriginCoordinate * 2) + self.elementSize
        
        self.rightOriginCoordinate = (self.elementSize * 2) + (self.leftOriginCoordinate * 3)
    }
    
    private func setupFrames() {
        
        setupCar()
        
        setupTree()
        
        setupBarrier()
        
        setupRock()
    }
    
    private func setupCar() {
        
        let yCoordinateOfCar = self.screenHeight - self.bottomSafeAreaPadding - self.elementSize - self.defaultPadding
        
        self.car.frame = CGRect(x: self.centerOriginCoordinate,
                                y: yCoordinateOfCar,
                                width: self.elementSize,
                                height: self.elementSize)
    }
    
    private func setupTree() {
        
        let yCoordinateOfTree = (self.topSafeAreaPadding + self.navigationBarHeight) * 3
        
        self.tree.frame = CGRect(x: self.leftOriginCoordinate,
                                 y: yCoordinateOfTree,
                                 width: self.elementSize,
                                 height: self.elementSize)
    }
    
    private func setupBarrier() {
        
        let yCoordinateOfBarrier = (self.topSafeAreaPadding + self.navigationBarHeight) * 2
        
        self.barrier.frame = CGRect(x: self.centerOriginCoordinate,
                                    y: yCoordinateOfBarrier,
                                    width: self.elementSize,
                                    height: self.elementSize)
    }
    
    private func setupRock() {
        
        let yCoordinateOfRock = (self.topSafeAreaPadding + self.navigationBarHeight)
        
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
        
        self.view.addSubview(self.road)
        
        self.view.sendSubviewToBack(self.road)
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

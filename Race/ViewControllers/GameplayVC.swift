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
    
    private let defaultPadding: CGFloat = 50
    
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
        
        setupSwipeGestureRecognizer()
        
        setupContentModeForImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        setupCoordinates()
        
        setupFrames()
        
        addSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        animateObstacles()
    }
    
    @objc func moveCar(sender: UISwipeGestureRecognizer) {
        
        var destinationCoordinate: CGFloat = 0
        
        switch sender.direction {
            
        case .left:
            
            if self.car.frame.origin.x == self.rightOriginCoordinate {
                
                destinationCoordinate = self.centerOriginCoordinate
                
            } else if self.car.frame.origin.x == self.centerOriginCoordinate {
                
                destinationCoordinate = self.leftOriginCoordinate
                
            } else if self.car.frame.origin.x == self.leftOriginCoordinate {
                
                destinationCoordinate = self.leftOriginCoordinate
            }
            
        case .right:
            
            if self.car.frame.origin.x == self.leftOriginCoordinate {
                
                destinationCoordinate = self.centerOriginCoordinate
                
            } else if self.car.frame.origin.x == self.centerOriginCoordinate {
                
                destinationCoordinate = self.rightOriginCoordinate
                
            } else if self.car.frame.origin.x == self.rightOriginCoordinate {
                
                destinationCoordinate = self.rightOriginCoordinate
            }
            
        default:
            break
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn]) { [weak self] in
            self?.car.frame.origin.x = destinationCoordinate
        }
    }
    
    // MARK: - Private Methods
    
    private func setupContentModeForImages() {
        
        self.road.contentMode = .scaleAspectFill
        
        self.car.contentMode = .scaleAspectFit
        
        self.tree.contentMode = .scaleAspectFit
        
        self.barrier.contentMode = .scaleAspectFit
        
        self.rock.contentMode = .scaleAspectFit
    }
    
    private func setupSwipeGestureRecognizer() {
        
        setupLeftSwipe()
        
        setupRightSwipe()
    }
    
    // MARK: lSwipe
    
    private func setupLeftSwipe() {
        
        let lSwipe = UISwipeGestureRecognizer()
        
        lSwipe.direction = .left
        
        lSwipe.addTarget(self, action: #selector(moveCar))
        
        self.view.addGestureRecognizer(lSwipe)
    }
    
    // MARK: rSwipe
    
    private func setupRightSwipe() {
        
        let rSwipe = UISwipeGestureRecognizer()
        
        rSwipe.direction = .right
        
        rSwipe.addTarget(self, action: #selector(moveCar))
        
        self.view.addGestureRecognizer(rSwipe)
    }
    
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
        
        setupRoad()
    }
    
    private func setupCar() {
        
        let yCoordinateOfCar = self.screenHeight - self.bottomSafeAreaPadding - self.elementSize - self.defaultPadding
        
        self.car.frame = CGRect(x: self.centerOriginCoordinate,
                                y: yCoordinateOfCar,
                                width: self.elementSize,
                                height: self.elementSize)
        
        self.car.layer.shadowColor = UIColor.black.cgColor
        
        self.car.layer.shadowOpacity = 0.6
        
        self.car.layer.shadowRadius = 15
        
        self.car.layer.shadowOffset = CGSize(width: 0, height: 25)
    }
    
    private func setupTree() {
        
        let yCoordinateOfTree = -self.elementSize * 2
        
        self.tree.frame = CGRect(x: self.leftOriginCoordinate,
                                 y: yCoordinateOfTree,
                                 width: self.elementSize,
                                 height: self.elementSize)
        
        self.tree.layer.shadowColor = UIColor.black.cgColor
        
        self.tree.layer.shadowOpacity = 0.5
        
        self.tree.layer.shadowRadius = 15
        
        self.tree.layer.shadowOffset = CGSize(width: 0, height: 50)
    }
    
    private func setupBarrier() {
        
        let yCoordinateOfBarrier = -elementSize * 2
        
        self.barrier.frame = CGRect(x: self.centerOriginCoordinate,
                                    y: yCoordinateOfBarrier,
                                    width: self.elementSize,
                                    height: self.elementSize)
        
        self.barrier.layer.shadowColor = UIColor.black.cgColor
        
        self.barrier.layer.shadowOpacity = 0.5
        
        self.barrier.layer.shadowRadius = 15
        
        self.barrier.layer.shadowOffset = CGSize(width: 0, height: 35)
        
    }
    
    private func setupRock() {
        
        let yCoordinateOfRock = -elementSize * 2
        
        self.rock.frame = CGRect(x: self.rightOriginCoordinate,
                                 y: yCoordinateOfRock,
                                 width: self.elementSize,
                                 height: self.elementSize)
        
        self.rock.layer.shadowColor = UIColor.black.cgColor
        
        self.rock.layer.shadowOpacity = 0.6
        
        self.rock.layer.shadowRadius = 15
        
        self.rock.layer.shadowOffset = CGSize(width: 0, height: 25)
    }
    
    private func setupRoad() {
        
        self.road.frame.size.width = self.screenWidth
        
        self.road.frame.size.height = self.screenHeight
    }
    
    private func addSubviews() {
        
        self.view.addSubview(self.car)
        
        self.view.addSubview(self.tree)
        
        self.view.addSubview(self.barrier)
        
        self.view.addSubview(self.rock)
        
        self.view.addSubview(self.road)
        
        self.view.sendSubviewToBack(self.road)
    }
    
    private func animateObstacles() {
        
        animateTree()
        
        animateBarrier()
        
        animateRock()
    }
    
    private func animateTree() {
        
        UIView.animate(withDuration: 5, delay: 1, options: [.curveLinear, .repeat]) { [weak self] in
            self?.tree.frame.origin.y = self?.screenHeight ?? 999
        }
    }
    
    private func animateBarrier() {
        
        UIView.animate(withDuration: 5, delay: 2.5, options: [.curveLinear, .repeat]) { [weak self] in
            self?.barrier.frame.origin.y = self?.screenHeight ?? 999
        }
    }
    
    private func animateRock() {
        
        UIView.animate(withDuration: 5, delay: 3.5, options: [.curveLinear, .repeat]) { [weak self] in
            self?.rock.frame.origin.y = self?.screenHeight ?? 999
        }
    }
    
}

//
//  ViewController.swift
//  Race
//
//  Created by Robert Kotrutsa on 07.02.2024.
//

import UIKit

import AVFAudio

class MenuVC: UIViewController {
    
    // MARK: - Properties
    
    private let backgroundManager = BackgroundManager()
    
    private var audioPlayer: AVAudioPlayer?
    
    // MARK: - Outlets
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitle()
        
        self.backgroundManager.setupBackgroundImage(self.view, backgroundImage: "bg-menu")
        
        setupStartButton()
        
        setupAudioPlayer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(switcherValueChanged(_:)), name: Notification.Name("SwitcherValueChanged"), object: nil)
    }
    
    @objc func switcherValueChanged(_ notification: Notification) {
        
        guard let isOn = notification.object as? Bool else { return }
        
        if isOn {
            
            audioPlayer?.play()
            
        } else {
            
            audioPlayer?.pause()
            
        }
    }
    
    private func setupAudioPlayer() {
        
        guard let musicURL = Bundle.main.url(forResource: "background_music", withExtension: "mp3") else {
            
            print("Failed to find background_music.mp3")
            
            return
        }
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: musicURL)
            
            audioPlayer?.numberOfLoops = -1
            
            audioPlayer?.play()
            
        } catch {
            
            print("Error initializing audio player: \(error.localizedDescription)")
            
        }
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



//
//  AppDelegate.swift
//  Race
//
//  Created by Robert Kotrutsa on 07.02.2024.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var audioPlayer: AVAudioPlayer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupAudioPlayer()
        
        return true
    }
    
    func setupAudioPlayer() {
        
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
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}


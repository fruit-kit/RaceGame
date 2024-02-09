//
//  SettingsVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 09.02.2024.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Properties
    
    private var settings: [Setting] = [Setting(settingName: "Sound", switchValue: true)]

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: Bundle.main)
        
        tableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")

        setupTitle()
        setupBackgroundImage()
    }
    

    // MARK: - Private Methods
    
    private func setupTitle() {
        
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupBackgroundImage() {
        
        guard let backgroundImage = UIImage(named: "bg-settings") else { return }
        
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView)
    }

}

// MARK: - Extensions

// MARK: DataSource

extension SettingsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        
        cell.settingName.text = self.settings[index].settingName
        
        cell.settingSwitcher.isOn = self.settings[index].switchValue
        
        return cell
    }
    
}

// MARK: Delegates

extension SettingsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

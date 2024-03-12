//
//  SettingsVC.swift
//  Race
//
//  Created by Robert Kotrutsa on 09.02.2024.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Properties
    
    private let settings = SettingsManager.shared.settings
    
    private let backgroundManager = BackgroundManager()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTitle()
        
        self.backgroundManager.setupBackgroundImage(self.view, backgroundImage: "bg-settings")
        
        setupTableView()
    }
    
    
    // MARK: - Private Methods
    
    private func setupTitle() {
        
        self.title = "Settings"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell() {
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: Bundle.main)
        
        tableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")
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

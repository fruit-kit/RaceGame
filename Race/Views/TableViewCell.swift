//
//  TableViewCell.swift
//  Race
//
//  Created by Robert Kotrutsa on 09.02.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var settingName: UILabel!
    
    @IBOutlet weak var settingSwitcher: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func settingSwitcherPressed(_ sender: UISwitch) {
        
        NotificationCenter.default.post(name: Notification.Name("SwitcherValueChanged"), object: sender.isOn)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

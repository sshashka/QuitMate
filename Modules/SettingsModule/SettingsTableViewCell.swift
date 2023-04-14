//
//  SettingsTableViewCell.swift
//  QuitMate
//
//  Created by Саша Василенко on 11.04.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    static let identifier = "SettingsTableViewCell"
    private let settingsTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Sas"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(settingsTextLabel)
        self.backgroundColor = .clear
        settingsTextLabel.frame = contentView.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

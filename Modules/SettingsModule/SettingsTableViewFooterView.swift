//
//  SettingsTableViewFooterView.swift
//  QuitMate
//
//  Created by Саша Василенко on 11.04.2023.
//

import UIKit

class SettingsTableViewFooterView: UIView {
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: Constants.greenButtonColor)
        button.setTitle("Log out", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoutButton)
        logoutButton.frame = self.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

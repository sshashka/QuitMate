//
//  SettingsViewController.swift
//  QuitMate
//
//  Created by Саша Василенко on 11.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    private let gradientLayer = CAGradientLayer()
    private let settingsTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tv.backgroundColor = .clear
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsTableView)
        setupConstraints()
        view.setBackground(gradientLayer: gradientLayer)
        view.makeGlassEffectOnView(style: .light)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        let loguotButtonView = SettingsTableViewFooterView(frame: CGRect(x: 0, y: 0, width: settingsTableView.frame.width, height: 65))
        settingsTableView.tableFooterView = loguotButtonView
    }
}

private extension SettingsViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 65
    }
}

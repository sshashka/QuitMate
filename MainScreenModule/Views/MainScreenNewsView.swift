//
//  MainScreenNewsView.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import UIKit
import SwiftUI

final class MainScreenNewsView: UIViewController {
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Info"
        label.backgroundColor = .clear
        label.setHelveticaBoldFont(size: 22)
        label.textAlignment = .center
        return label
    }()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: NewsFeedTableViewCell.identifier)
        return tv
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoLabel, tableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = Constants.basicStackViewSpacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rootStackView)
        view.makeGlassEffectOnView(style: .light)
        view.backgroundColor = .white.withAlphaComponent(0.3)
        view.layer.cornerRadius = 26
        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.clear.cgColor
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        setupConstraints()
    }
}

private extension MainScreenNewsView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MainScreenNewsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedTableViewCell.identifier, for: indexPath) as? NewsFeedTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        cell.setData(articleImage: UIImage(named: "Tokyo")!, aricleHeading: "I love to smack some ass", articlePreviewText: "Fuck you nigga nigga nigga nigga nigga nigga nigga nigga")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

struct MainScreenNewsViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return MainScreenViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MainScreenNewsViewController_Preview: PreviewProvider {
    static var previews: some View {
        MainScreenNewsViewControllerRepresentable()
    }
}

//
//  MainScreenNewsView.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import UIKit
import SwiftUI

enum MainScreenNewsTableViewSections {
    case main
}

final class MainScreenNewsView: UIViewController {
    // MARK: Creating variables
    var presenter: MainScreenNewsViewPresenterProtocol?
    private var news: MainScreenNews?
    private var newsCount = 0
    private var isLoadingNews: Bool = false
    private lazy var snapshot = NSDiffableDataSourceSnapshot<MainScreenNewsTableViewSections, MainScreenNewsModuleModel>()
    
    private lazy var dataSource =  UITableViewDiffableDataSource<MainScreenNewsTableViewSections,MainScreenNewsModuleModel>(
        tableView: tableView,
        cellProvider: {
            (tableView, indexPath, item) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NewsFeedTableViewCell.identifier,
                for: indexPath
            ) as? NewsFeedTableViewCell
            guard let cell = cell else { return UITableViewCell() }
            cell.setData(news: item)
            indexPath.row % 2 == 0 ? cell.setLayout(layout: .rightToLeft) : cell.setLayout(layout: .leftToRight)
            
            return cell
        }
    )
    
    // MARK: Creating UI elements
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: NewsFeedTableViewCell.identifier)
        tableView.separatorColor = .clear
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.makeGlassEffectOnView(style: .light)
        view.backgroundColor = .white.withAlphaComponent(0.3)
        view.layer.cornerRadius = 26
        view.layer.masksToBounds = true
        tableView.delegate = self
        tableView.backgroundColor = .clear
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getNews(for: 1)
    }
}
// MARK: Private methods
private extension MainScreenNewsView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.commonLayoutConstant),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func loadMoreNews() {
        if !isLoadingNews {
            isLoadingNews.toggle()
            presenter?.getNewsForNextPage()
        }
    }
}
// MARK: UITableViewDelegate
extension MainScreenNewsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == newsCount - 1, !isLoadingNews {
            loadMoreNews()
        }
    }
}
// MARK: MainScreenNewsViewProtocol
extension MainScreenNewsView: MainScreenNewsViewProtocol {
    func showNews(news: MainScreenNews) {
        if snapshot.numberOfSections == 0 {
            snapshot.appendSections([.main])
        }
        snapshot.appendItems(news, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
        
        newsCount += news.count
        isLoadingNews = false
    }
}

struct MainScreenNewsViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return MainScreenViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MainScreenNewsViewControllerPreview: PreviewProvider {
    static var previews: some View {
        MainScreenNewsViewControllerRepresentable()
    }
}

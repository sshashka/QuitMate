//
//  MainScreenNewsViewPresenter.swift
//  QuitMate
//
//  Created by Саша Василенко on 28.02.2023.
//

import Foundation


final class MainScreenNewsViewPresenter: MainScreenNewsViewPresenterProtocol {
    let networkingService: MainScreenModuleNetworkingProtocol!
    private var page: Int = 1 {
        didSet {
            getNews(for: page)
        }
    }
    weak var view: MainScreenNewsViewProtocol?
    
    init(networkingService: MainScreenModuleNetworkingProtocol, view: MainScreenNewsViewProtocol) {
        self.view = view
        self.networkingService = networkingService
    }
    
    func getNews(for page: Int = 1) {
        networkingService.getNews(for: page) {[weak self] articles in
            self?.view?.showNews(news: articles)
        }
    }
    
    func getNewsForNextPage() {
        page += 1
    }
}

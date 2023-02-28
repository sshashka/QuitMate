//
//  MainScreenNewsViewPresenterProtocol.swift
//  QuitMate
//
//  Created by Саша Василенко on 28.02.2023.
//

import Foundation

protocol MainScreenNewsViewPresenterProtocol: AnyObject {
    func getNews(for page: Int)
    func getNewsForNextPage()
}

//
//  MainScreenModuleNetworkingProtocol.swift
//  QuitMate
//
//  Created by Саша Василенко on 01.03.2023.
//

protocol MainScreenModuleNetworkingProtocol: AnyObject {
    func getNews(for page: Int, completion: @escaping(MainScreenNews) -> Void)
}

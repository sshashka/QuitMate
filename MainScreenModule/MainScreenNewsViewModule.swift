//
//  MainScreenNewsViewModule.swift
//  QuitMate
//
//  Created by Саша Василенко on 28.02.2023.
//

import Foundation

extension MainScreenNewsView {
    static var module: MainScreenNewsView {
        let networking = MainScreenModuleNetworking()
        let view = MainScreenNewsView()
        let presenter = MainScreenNewsViewPresenter(networkingService: networking, view: view)
        view.presenter = presenter
        
        return view
    }
}

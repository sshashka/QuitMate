//
//  AuthentificationModule.swift
//  QuitMate
//
//  Created by Саша Василенко on 25.02.2023.
//

import Foundation

extension AutentificationViewController {
    static var module: AutentificationViewController {
        let authService = AuthentificationService()
        let viewController = AutentificationViewController()
        let presenter = AuthentificationModulePresenter(view: viewController, authentificationService: authService)
        viewController.presenter = presenter
        
        return viewController
    }
}

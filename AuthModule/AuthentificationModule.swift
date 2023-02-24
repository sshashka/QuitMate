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
        let vc = AutentificationViewController()
        let presenter = AuthentificationModulePresenter(view: vc, authentificationService: authService)
        vc.presenter = presenter
        
        return vc
    }
}

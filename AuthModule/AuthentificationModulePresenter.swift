//
//  AuthentificationModulePresenter.swift
//  QuitMate
//
//  Created by Саша Василенко on 25.02.2023.
//

import Foundation

protocol AutentificationViewControllerProtocol: AnyObject {
    func didReceiveErrorFromFirebaseAuth(error: String)
}

protocol AuthentificationModulePresenterProtocol: AnyObject {
    func didSelectLoginWithEmailLogin(email: String, password: String)
    func didSelectRegisterWithEmailLogin(email: String, password: String)
}

class AuthentificationModulePresenter: AuthentificationModulePresenterProtocol {
    
    weak var view: AutentificationViewControllerProtocol?
    let authentificationService: AuthentificationServiceProtocol!
    
    init(view: AutentificationViewControllerProtocol, authentificationService: AuthentificationServiceProtocol) {
        self.view = view
        self.authentificationService = authentificationService
    }
    
    func didSelectLoginWithEmailLogin(email: String, password: String) {
        
    }
    
    func didSelectRegisterWithEmailLogin(email: String, password: String) {
        authentificationService.didSelectRegisterWithEmailLogin(email: email, password: password) {[weak self] result in
            switch result {
            case .success:
                fatalError("success is not implemented")
            case .failure(let reason):
                self?.view?.didReceiveErrorFromFirebaseAuth(error: reason)
            }
        }
    }
}

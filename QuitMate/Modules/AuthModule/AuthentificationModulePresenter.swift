//
//  AuthentificationModulePresenter.swift
//  QuitMate
//
//  Created by Саша Василенко on 25.02.2023.
//

import Foundation

protocol AutentificationViewControllerProtocol: AnyObject {
    func didReceiveErrorFromFirebaseAuth(error: String)
    func didRegisterSuccesfully(message: String)
}

protocol AuthentificationModulePresenterProtocol: AnyObject {
    var didSendEventClosure: ((AuthentificationModulePresenter.EventType) -> Void)? {get set}
    func didSelectLoginWithEmailLogin(email: String, password: String)
    func didSelectRegisterWithEmailLogin(email: String, password: String)
}

final class AuthentificationModulePresenter: AuthentificationModulePresenterProtocol {
    var didSendEventClosure: ((AuthentificationModulePresenter.EventType) -> Void)?
    weak var view: AutentificationViewControllerProtocol?
    let authentificationService: AuthentificationServiceProtocol!
    
    init(view: AutentificationViewControllerProtocol, authentificationService: AuthentificationServiceProtocol) {
        self.view = view
        self.authentificationService = authentificationService
    }
    
    func didSelectLoginWithEmailLogin(email: String, password: String) {
        authentificationService.didSelectLoginWithEmailLogin(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.didSendEventClosure?(.authentification)
            case .failure(let reason):
                self?.view?.didReceiveErrorFromFirebaseAuth(error: reason)
            }
        }
    }
    
    func didSelectRegisterWithEmailLogin(email: String, password: String) {
        authentificationService.didSelectRegisterWithEmailLogin(email: email, password: password) {[weak self] result in
            switch result {
            case .success:
                self?.view?.didRegisterSuccesfully(message: "You have successfully registered. Now tap login button to enter")
            case .failure(let reason):
                self?.view?.didReceiveErrorFromFirebaseAuth(error: reason)
            }
        }
    }
}

extension AuthentificationModulePresenter {
    enum EventType { case authentification }
}

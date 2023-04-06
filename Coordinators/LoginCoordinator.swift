//
//  LoginCoordinator.swift
//  QuitMate
//
//  Created by Саша Василенко on 06.04.2023.
//

import UIKit

protocol LoginCoordinatorProtocol: Coordinator {
    func showAuthentificationViewController()
}


class LoginCoordinator: LoginCoordinatorProtocol {
    func showAuthentificationViewController() {
        let authentificationVC = AutentificationViewController.module
        authentificationVC.presenter?.didSendEventClosure = { [weak self] event in
            self?.finish()
        }

        navigationController.pushViewController(authentificationVC, animated: true)
    }
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .login}
    
    func start() {
        showAuthentificationViewController()
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

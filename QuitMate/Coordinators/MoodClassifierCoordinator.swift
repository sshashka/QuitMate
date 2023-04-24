//
//  MoodClassifierCoordinator.swift
//  QuitMate
//
//  Created by Саша Василенко on 20.04.2023.
//

import UIKit

protocol MoodClassifierCoordinatorProtocol: Coordinator {
    func showMoodClassifierViewController()
}

final class MoodClassifierCoordinator: MoodClassifierCoordinatorProtocol {
    func showMoodClassifierViewController() {
        let vc = MoodClassifierViewController()
//        vc.presenter?.didSendEventClosure = { [weak self] event in
//            self?.finish()
//        }
        navigationController.pushViewController(vc, animated: true)
    }
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType {.moodClassifier}
    
    func start() {
        showMoodClassifierViewController()
    }
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

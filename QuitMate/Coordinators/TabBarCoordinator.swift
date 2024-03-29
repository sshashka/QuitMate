//
//  TabBarCoordinator.swift
//  QuitMate
//
//  Created by Саша Василенко on 07.04.2023.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get }
}

final class TabBarCoordinator: NSObject, Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .tabbar }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPages] = [.charts, .home, .setup]
        
        let controllers: [UINavigationController] = pages.map {getTabControllers(page: $0)}
        
        setupTabBar(controllers: controllers)
    }
    
    private func getTabControllers(page: TabBarPages) -> UINavigationController {
        let navVC = UINavigationController()
        navVC.tabBarItem = UITabBarItem.init(title: nil, image: page.getImages(), selectedImage: nil)
        navVC.setNavigationBarHidden(true, animated: false)
        switch page {
        case .charts:
            let chartsVC = ReasonsToStopViewController.module
            navVC.pushViewController(chartsVC, animated: true)
        case .home:
            let mainVC = MainScreenViewController()
            navVC.pushViewController(mainVC, animated: true)
        case .setup:
//            let settingsVC = SettingsViewController()
            let settingsVC = MoodClassifierViewController()
            navVC.pushViewController(settingsVC, animated: true)
        }
        
        return navVC
    }
    
    private func setupTabBar(controllers tabController: [UIViewController]) {
        tabBarController.tabBar.tintColor = UIColor(named: Constants.purpleColor)
        tabBarController.tabBar.backgroundColor = .clear
        tabBarController.tabBar.makeGlassEffectOnView(style: .light)
        tabBarController.setViewControllers(tabController, animated: true)
        navigationController.viewControllers = [tabBarController]
    }
}

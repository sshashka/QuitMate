//
//  TabBarController.swift
//  QuitMate
//
//  Created by Саша Василенко on 02.03.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        setTabBarAppearence()
    }
    func createTabBar() {
        viewControllers = [generateVC(vc: ReasonsToStopView(), image: UIImage(systemName: "chart.xyaxis.line")!), UINavigationController(rootViewController: generateVC(vc: MainScreenViewController(), image: UIImage(systemName: "house")!)), generateVC(vc: CalendarViewController(), image: UIImage(systemName: "gear")!)]
    }
}

private extension TabBarController {
    func generateVC(vc: UIViewController, image: UIImage) -> UIViewController {
        vc.tabBarItem.image = image
        vc.tabBarItem.isEnabled = true
        return vc
    }
    
    func setTabBarAppearence() {
        let positionX: CGFloat = 10
        let positionY: CGFloat = 14
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        
        let roundedLayer = CAShapeLayer()
        
        let beizerPath = UIBezierPath(roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - positionY - 5, width: width, height: height), cornerRadius: height / 2)
        roundedLayer.path = beizerPath.cgPath
        roundedLayer.fillColor = UIColor.white.withAlphaComponent(0.7).cgColor

        tabBar.itemPositioning = .centered
        tabBar.itemWidth = width / 3
        tabBar.layer.insertSublayer(roundedLayer, at: 0)
        tabBar.tintColor = UIColor(named: Constants.greenButtonColor)
    }
}

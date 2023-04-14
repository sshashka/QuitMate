//
//  TabBarController.swift
//  QuitMate
//
//  Created by Саша Василенко on 02.03.2023.
//
//MARK: Not in use anymore
//import UIKit
//import SwiftUI
//
//final class TabBarController: UITabBarController {
//    let mainScreenImage: UIImage = {
//        let config = UIImage.SymbolConfiguration(pointSize: 20)
//        let image = UIImage(systemName: "house")?.applyingSymbolConfiguration(config)
//        return image!
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createTabBar()
//        setTabBarAppearence()
//    }
//    func createTabBar() {
//        viewControllers = [generateVC(vc: ReasonsToStopViewController.module, image: UIImage(systemName: "chart.xyaxis.line")!), UINavigationController(rootViewController: generateVC(vc: MainScreenViewController(), image: mainScreenImage))]
//    }
//}
//
//private extension TabBarController {
//    func generateVC(vc: UIViewController, image: UIImage) -> UIViewController {
//        vc.tabBarItem.image = image
//        vc.tabBarItem.isEnabled = true
//        return vc
//    }
//    func setTabBarAppearence() {
//        let positionX: CGFloat = 10
//        let positionY: CGFloat = 16
//        let width = tabBar.bounds.width - positionX * 2
//        let height = tabBar.bounds.height + positionY * 2
//
//        let roundedLayer = CAShapeLayer()
//
//        let beizerPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: tabBar.bounds.width, height: height), cornerRadius: height / 2)
//        roundedLayer.path = beizerPath.cgPath
//        roundedLayer.fillColor = UIColor.systemBackground.cgColor
//
//        tabBar.itemWidth = width / 3
//        tabBar.layer.insertSublayer(roundedLayer, at: 0)
//        tabBar.tintColor = UIColor(named: Constants.greenButtonColor)
//        tabBar.backgroundColor = .systemBackground
//    }
//}

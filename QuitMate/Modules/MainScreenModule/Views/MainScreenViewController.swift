//
//  MainScreenViewController.swift
//  QuitMate
//
//  Created by Саша Василенко on 16.02.2023.
//

import UIKit
import SwiftUI

final class MainScreenViewController: UIViewController {
    private let timerView: UIHostingController = UIHostingController(rootView: TimerView())
    
    private let newsView = MainScreenNewsView.module
    private let gradientLayer = CAGradientLayer()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timerView.view, newsView.view])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.basicStackViewSpacing
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Constants.backgroundColor)
        view.addSubview(timerView.view)
        addChild(newsView)
        view.addSubview(newsView.view)
        newsView.didMove(toParent: self)
        view.addSubview(stackView)
        setupTimerView()
        setupConstraints()
//        didTapOnResetButton()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        showNewsView()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        //        view.setAppearanceColors(gradientLayer: gradientLayer)
    }
}

extension MainScreenViewController {
    func didTapOnResetButton() {
        let vc = ReasonsToStopViewController.module
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        //        let alert = UIAlertController(title: "Do you want to continue", message: "This will reset your timer", preferredStyle: .alert)
        //
        //        let confirmAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
        //            let vc = ReasonsToStopViewController.module
        //            self?.navigationController?.pushViewController(vc, animated: true)
        //        }
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        //
        //        alert.addAction(confirmAction)
        //        alert.addAction(cancelAction)
        //
        //        present(alert, animated: true)
    }
}
private extension MainScreenViewController {
    func setupTimerView() {
        timerView.view.translatesAutoresizingMaskIntoConstraints = false
        timerView.view.backgroundColor = .clear
        addChild(timerView)
        timerView.didMove(toParent: self)
    }
    
    //    func showNewsView() {
    //
    //        newsView.isModalInPresentation = false
    //        newsView.view.layer.shadowColor = UIColor.white.cgColor
    //        if let sheet = newsView.sheetPresentationController {
    //            sheet.detents = [.medium(), .large()]
    //            sheet.largestUndimmedDetentIdentifier = .medium
    //            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
    //            sheet.prefersEdgeAttachedInCompactHeight = true
    //            sheet.prefersGrabberVisible = true
    //            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
    //        }
    //        present(newsView, animated: true)
    //    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: -Constants.spacing),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.spacing),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.spacing),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.spacing)
            //            newsView.view.heightAnchor.constraint(equalToConstant: view.frame.height*(3/6))
            //            ProgressView.view.topAnchor.constraint(equalTo: view.topAnchor),
            //            ProgressView.view.heightAnchor.constraint(equalToConstant: view.frame.height/2 - 50),
            //            ProgressView.view.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            //            ProgressView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

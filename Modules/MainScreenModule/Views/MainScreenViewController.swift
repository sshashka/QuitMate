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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timerView.view, newsView.view])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.basicStackViewSpacing * 2
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        view.addSubview(timerView.view)
        addChild(newsView)
        view.addSubview(newsView.view)
        newsView.didMove(toParent: self)
        view.addSubview(stackView)
        setupTimerView()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        showNewsView()
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
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            timerView.view.widthAnchor.constraint(equalToConstant: view.frame.width * (2/3))
//            timerView.view.topAnchor.constraint(equalTo: view.topAnchor),
//            timerView.view.heightAnchor.constraint(equalToConstant: view.frame.height/2 - 50),
//            timerView.view.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
//            timerView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return MainScreenViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

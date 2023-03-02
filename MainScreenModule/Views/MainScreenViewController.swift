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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        view.addSubview(timerView.view)
        setupTimerView()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNewsView()
    }
}

private extension MainScreenViewController {
    func setupTimerView() {
        timerView.view.translatesAutoresizingMaskIntoConstraints = false
        timerView.view.backgroundColor = .clear
        addChild(timerView)
        timerView.didMove(toParent: self)
    }
    
    func showNewsView() {
        let newsView = MainScreenNewsView.module
        newsView.isModalInPresentation = false
        newsView.view.layer.shadowColor = UIColor.white.cgColor
        if let sheet = newsView.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.prefersGrabberVisible = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(newsView, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timerView.view.topAnchor.constraint(equalTo: view.topAnchor),
            timerView.view.heightAnchor.constraint(equalToConstant: view.frame.height/2 - 50),
            timerView.view.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            timerView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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

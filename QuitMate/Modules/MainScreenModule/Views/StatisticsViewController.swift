//
//  StatisticsViewController.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import UIKit

class StatisticsViewController: UIViewController {
    private let a: StatisticsView = {
        let view = StatisticsView(image: "Money", titleText: "$52.24", bottomText: "Sosi hui")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let b: StatisticsView = {
        let view = StatisticsView(image: "Money", titleText: "$52.24", bottomText: "Sosi hui")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let c: StatisticsView = {
        let view = StatisticsView(image: "Money", titleText: "$52.24", bottomText: "Sosi hui")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let d: StatisticsView = {
        let view = StatisticsView(image: "Money", titleText: "$52.24", bottomText: "Sosi hui")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var acStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [a, c])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var bdStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [b, d])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [acStackView, bdStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rootStackView)
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: view.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

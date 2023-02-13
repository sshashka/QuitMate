//
//  ViewController.swift
//  QuitMate
//
//  Created by Саша Василенко on 13.02.2023.
//

import UIKit
import SwiftUI

class LoginAndRegistrationViewController: UIViewController {
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.layer.cornerRadius = 40
        textField.layer.masksToBounds = true
        textField.setLeftPaddingPoints(20)
        textField.setRightPaddingPoints(20)
        textField.backgroundColor = .clear
        textField.makeGlassEffectOnView()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password at least 8 characters"
        textField.layer.cornerRadius = 40
        textField.layer.masksToBounds = true
        textField.makeGlassEffectOnView()
        textField.setLeftPaddingPoints(20)
        textField.setRightPaddingPoints(20)
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "ButtonsColor")
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 40
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.setCustomSpacing(16, after: emailTextField)
        stackView.setCustomSpacing(32, after: passwordTextField)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        view.backgroundColor = nil
        view.addSubview(stackView)
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
}

private extension LoginAndRegistrationViewController {
    // MARK: Setting up view
    func setBackground() {
        let topColor = UIColor(named: "TopColor")?.cgColor
        let bottomColot = UIColor(named: "BottomColor")?.cgColor
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColor, bottomColot]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.widthAnchor.constraint(equalToConstant: 282),
            
            stackView.heightAnchor.constraint(equalToConstant: view.frame.height/3)
        ])
    }
}


struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return LoginAndRegistrationViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

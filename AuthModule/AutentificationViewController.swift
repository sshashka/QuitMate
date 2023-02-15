//
//  ViewController.swift
//  QuitMate
//
//  Created by Саша Василенко on 13.02.2023.
//

import UIKit
import Combine
import SwiftUI


class AutentificationViewController: UIViewController {
    // MARK: Creating UI elements
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.layer.cornerRadius = 26
        textField.layer.masksToBounds = true
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
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
        textField.layer.cornerRadius = 26
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
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
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "ButtonsColor")
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 26
        button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: Setting up buttons and textFields stackView
    private lazy var buttonsAndTextFieldsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, registerButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.setCustomSpacing(32, after: passwordTextField)
        return stackView
    }()
    
    private var cancellables = Set<AnyCancellable>()
    // MARK: Init subjects
    private var emailSubject = CurrentValueSubject<String, Never>("")
    private var passwordSubject = CurrentValueSubject<String, Never>("")
    
    // MARK: Publishers
    private var emailIsValid: AnyPublisher<Bool, Never> {
        emailSubject
            .map{ [weak self] in
                self?.emailIsValid(email: $0)
            }
            .replaceNil(with: false)
            .eraseToAnyPublisher()
            
    }
    
    private var passwordIsValid: AnyPublisher<Bool, Never> {
        passwordSubject
            .map{ [weak self] in
                self?.passwordIsValid(password: $0)
            }
            .replaceNil(with: false)
            .eraseToAnyPublisher()
    }
    
    private var formIsValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(emailIsValid, passwordIsValid)
            .map{ $0.0 && $0.1 }
            .eraseToAnyPublisher()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        view.backgroundColor = nil
        view.addSubview(buttonsAndTextFieldsStackView)
        setupConstraints()

        emailTextField.addTarget(self, action: #selector(emailTextDidChange), for: .allEditingEvents)
        passwordTextField.addTarget(self, action: #selector(passwordTextDidChange), for: .allEditingEvents)
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        formIsValid
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &cancellables)
        formIsValid
            .assign(to: \.isEnabled, on: registerButton)
            .store(in: &cancellables)
    }
}

private extension AutentificationViewController {
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
            buttonsAndTextFieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsAndTextFieldsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonsAndTextFieldsStackView.widthAnchor.constraint(equalToConstant: 300),
            
            buttonsAndTextFieldsStackView.heightAnchor.constraint(equalToConstant: view.frame.height/3)
        ])
    }
    // MARK: Adding selectors to UI
    @objc func loginButtonDidTap() {
        print("Bruh")
    }
    
    @objc func emailTextDidChange(_ sender: UITextField) {
        emailSubject.send(sender.text ?? "")
    }
    
    @objc func passwordTextDidChange(_ sender: UITextField) {
        passwordSubject.send(sender.text ?? "")
    }
    
    func emailIsValid(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    func passwordIsValid(password: String) -> Bool {
        return password.count >= 8
    }
}


struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return AutentificationViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
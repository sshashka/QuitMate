//
//  AuthentificationService.swift
//  QuitMate
//
//  Created by Саша Василенко on 15.02.2023.
//

import Foundation
import FirebaseAuth

final class AuthentificationService {
    func registerWithEmailAndPassword(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
        }
    }
    
    func loginWithEmailAndPassword(email: String, password: String) {
        Auth.auth().signIn(withEmail: email.lowercased(), password: password)
    }
}

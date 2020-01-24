//
//  LoginViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 21/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

protocol LoginDisplayLogic {
    func setLoading(isLoading: Bool)
    func presentError(message: String)
    func goToHome()
}

class LoginViewModel {

    var delegate: LoginDisplayLogic?
    
    var email = ""
    var password = ""
    
    func buttonEnabled() -> Bool {
        if email.isEmpty || password.isEmpty {
            return false
        }
        return true
    }
    
    func performLogin() {
        delegate?.setLoading(isLoading: true)
        let login = Login(email: email, password: password)
        let repo = LoginRepository(login: login)
        repo.request { [weak self] result in
            self?.delegate?.setLoading(isLoading: false)
            switch result {
            case .success(let token):
                if let tkn = token.token {
                    UserDefaults.standard.set(tkn, forKey: "token")
                    self?.delegate?.goToHome()
                }
            case .failure(let error):
                self?.delegate?.presentError(message: error )
            }
            
        }
    }
    
}

//
//  LoginViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 21/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

class LoginViewModel {

    
    func performLogin(with email: String, and password: String) {
        let login = Login(email: email, password: password)
        let repo = LoginRepository(login: login)
        repo.request { result in
            switch result {
            case .success(let token):
                print("TOKEN: \(token.token ?? "")")
            case .failure(let error):
                print("TOKEN: \(error)")
            }
            
        }
    }
    
}

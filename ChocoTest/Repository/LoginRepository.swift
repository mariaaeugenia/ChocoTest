//
//  LoginRepository.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 21/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

struct LoginRepository: Repository {
    
    typealias T = Token
    let request = ApiManager.init()
    let login: Login?
    
    init(login: Login) {
        self.login = login
    }
    
    func request(completion: @escaping (Result<LoginRepository.T>) -> Void) {
        guard let email = login?.email, let pwd = login?.password else { return }
        request.manager(api: .login(username: email, password: pwd), completion: completion)
    }
    
}

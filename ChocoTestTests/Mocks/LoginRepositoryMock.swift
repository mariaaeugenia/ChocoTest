//
//  LoginRepositoryMock.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import ChocoTest


struct LoginRepositoryMock: Repository {
    
    typealias T = Token
    let request = ApiManager.init()
    let login: Login?
    
    init(login: Login) {
        self.login = login
    }
    
    func request(completion: @escaping (Result<Token>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            let filePath = "Login"
            JSONDataFileLoader.loadJsonDataFromFile(filePath, completion: { data in
                if let json = data {
                    do {
                        let decoded = try JSONDecoder().decode(Token.self, from: json)
                        completion(.success(decoded))
                    }
                    catch _ as NSError {
                        completion(.failure("ERROR"))
                    }
                }
            })
        }
    }
    
}

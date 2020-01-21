//
//  Error.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 19/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    case internalServerError = "Internal server error"
    case parserError = "Parameter encoding failed"
    case badUrl = "URL is nil"
    case parameterNil = "Parameter were nil"
    case authenticationError = "You need to login first"
    case emptyData = "Data not found"
    case other = "Undefined error"
}

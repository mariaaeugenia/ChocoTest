//
//  HTTPTask.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 19/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

public enum HTTPTask {
    case request
    case requestWith(parameters: Parameters)
}

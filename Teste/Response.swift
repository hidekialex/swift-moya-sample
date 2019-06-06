//
//  Response.swift
//  Teste
//
//  Created by user155404 on 6/6/19.
//  Copyright © 2019 user155404. All rights reserved.
//

import Foundation

struct Response : Decodable {
    
    var statusCode: Int
    var body: String
}

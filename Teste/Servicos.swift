//
//  Servicos.swift
//  Teste
//
//  Created by user155404 on 6/6/19.
//  Copyright © 2019 user155404. All rights reserved.
//

import Foundation
import Moya

enum Servicos {
    
    case criarCarta(card: Card)
}

extension Servicos: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://tc75a4hc3f.execute-api.us-east-1.amazonaws.com/magic")!
    }
    
    var path: String {
        return "/card"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case Servicos.criarCarta(let card):
            return .requestJSONEncodable(card)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

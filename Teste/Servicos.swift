//
//  Servicos.swift
//  Teste
//
//  Created by user155404 on 6/6/19.
//  Copyright © 2019 user155404. All rights reserved.
//

import Foundation
import Moya

// Enum que configura as chamadas http
enum Servicos {
    
    // declaracao de um enum que representa um serviço POST
    case criarCarta(card: Card)
}

extension Servicos: TargetType {
    
    // url do serviço
    var baseURL: URL {
        return URL(string: "https://tc75a4hc3f.execute-api.us-east-1.amazonaws.com/magic")!
    }
    
    // endpoint
    var path: String {
        return "/card"
    }
    
    // metodo utilizado no serviço
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    // utilizado Task do tipo requestJSONEncodable para enviar JSON
    var task: Task {
        switch self {
        case Servicos.criarCarta(let card):
            return .requestJSONEncodable(card)
        }
    }
    
    // definicao do content type do tipo application json
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

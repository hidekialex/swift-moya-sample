//
//  Card.swift
//  Teste
//
//  Created by user155404 on 6/6/19.
//  Copyright © 2019 user155404. All rights reserved.
//

import Foundation

// Classe que representa o JSON de request. A classe extende a classe Encodable
struct Card : Encodable {
    
    let nome: String
    let cor: String
    let ataque: Int
    let defesa: Int
}

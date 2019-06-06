//
//  ViewController.swift
//  Teste
//
//  Created by user155404 on 6/5/19.
//  Copyright © 2019 user155404. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //aqui esta instanciando o objeto do moya que chama o servidor
        let chamador = MoyaProvider<Servicos>()
        
        //// eu to criando um objeto que vai ser transformado
        // em json e mandado pro servidor
        /*
         {
            "nome": "nome",
            "cor": "red",
            "ataque": 2,
            "defesa": 1
         }
         */
        let card = Card(nome: "Goblin", cor: "Red", ataque: 2, defesa: 3)
        
        // Passar o o enum criarCarta declarado em Servicos
        chamador.request(Servicos.criarCarta(card: card)) { (result) in
            switch result {
                case .success(let response):
                    //Receita de bolo para converter o retorno do servidor em um objeto
                    //Passar no decode a classe que representa o JSON (no caso Response.self)
                    /**
                        {
                            "statusCode":200,
                            "body": "mensagem retorno"
                        }   
                    **/
                    let resposta = try! JSONDecoder().decode(Response.self, from: response.data)
                    print(resposta)
                case .failure(let error):
                    print(error)
            }
        }
    }
}


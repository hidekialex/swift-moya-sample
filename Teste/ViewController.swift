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

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfCor: UITextField!
    @IBOutlet weak var btnCriar: UIButton!
    
    let chamador = MoyaProvider<Servicos>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickCriae(_ sender: Any) {
    
        let nome = self.tfNome.text!
        let cor = self.tfCor.text!
        
        let card = Card(nome: nome, cor: cor, ataque: 2, defesa: 3)
 
        chamador.request(Servicos.criarCarta(card: card)) { (result) in
            switch result {
            case .success(let response):
                let resposta = try! JSONDecoder().decode(Response.self, from: response.data)
                let alert  = UIAlertController(title: "Parabens", message: resposta.body, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}


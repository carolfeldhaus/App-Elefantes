//
//  DetailViewController.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 18/10/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var elefanteTocado: Elefante = Elefante()
    var name: String = ""
    
    var arrayDeElefanteTocadoMais2: [Elefante] = []
    // UIImageView

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("elefante: \(elefanteTocado.name)")
        print("Quantidade: \(arrayDeElefanteTocadoMais2.count)")
    }
    
}

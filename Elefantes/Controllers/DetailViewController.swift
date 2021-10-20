//
//  DetailViewController.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 18/10/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var elefanteTocado: Elefante = Elefante()
    
    // UIImageView
    // name
    // specie
    // sex
    // note
    // botao para visualizar o link da wikipedia

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("elefante: \(elefanteTocado.name)")
    }
    
}

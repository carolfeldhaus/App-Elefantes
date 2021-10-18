//
//  ViewController.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 18/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayDeElefantes: [Elefante] = []
    let api = API()
    var uitv_Tabela = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.uitv_Tabela.frame = self.view.bounds
        self.uitv_Tabela.dataSource = self
        self.uitv_Tabela.delegate = self
        
        self.view.addSubview(self.uitv_Tabela)
        
        self.arrayDeElefantes = api.getElephants(urlString: api.setElephantsURL(), method: .GET)
        print("Quantidade de Elefantes: \(self.arrayDeElefantes.count)")
        self.uitv_Tabela.reloadData()
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDeElefantes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.arrayDeElefantes[indexPath.row].name
        cell.detailTextLabel?.text = self.arrayDeElefantes[indexPath.row].note
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = false
        cell.detailTextLabel?.numberOfLines = 5
        
        if let image = self.arrayDeElefantes[indexPath.row].image {
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            cell.imageView?.image = UIImage(data: data!)
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = DetailViewController()
        detail.elefanteTocado = self.arrayDeElefantes[indexPath.row]
        
        detail.arrayDeElefanteTocadoMais2 = [
            self.arrayDeElefantes[indexPath.row],
            self.arrayDeElefantes[indexPath.row + 1],
            self.arrayDeElefantes[indexPath.row + 2]
        ]
        
        
        
        
        if let name = self.arrayDeElefantes[indexPath.row].name {
            detail.name = name
        }
        self.show(detail, sender: nil)
//        self.showDetailViewController(detail, sender: nil)
    }
    
}



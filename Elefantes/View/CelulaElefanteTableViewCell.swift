//
//  CelulaElefanteTableViewCell.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 20/10/21.
//

import UIKit

class CelulaElefanteTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imagemElefante: UIImageView!
    @IBOutlet weak var labelNomeElefante: UILabel!
    @IBOutlet weak var labelDescricaoElefante: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

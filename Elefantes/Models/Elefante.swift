//
//  Elefante.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 18/10/21.
//

import Foundation


/*
{
        "_id": "5cf1d0dbcd5e98f2540c4d1c",
        "index": 3,
        "name": "Balarama",
        "affiliation": "Dasara",
        "species": "Asian",
        "sex": "Male",
        "fictional": "false",
        "dob": "1958",
        "dod": "-",
        "wikilink": "https://en.wikipedia.org/wiki/Balarama_(elephant)",
        "image": "https://elephant-api.herokuapp.com/pictures/missing.jpg",
        "note": "A lead elephant of the world-famous Mysore Dasara procession."
    },
*/

//Codable -> Encodable e Decodable

struct Elefante : Codable {
    var idid    : String?
//var index : Int?
    var name    : String?
//var affiliation : String?
    var species : String?
    var sex     : String?
//var fictional : String?
    var dob     : String?
    var dod     : String?
    var wikilink: String?
    var image   : String?
    var note    : String?
    
    init(idid     : String? = nil,
         name     : String? = nil,
         species  : String? = nil,
         sex      : String? = nil,
         dob      : String? = nil,
         dod      : String? = nil,
         wikilink : String? = nil,
         image    : String? = nil,
         note     : String? = nil) {
        
        self.idid     = idid
        self.name     = name
        self.species  = species
        self.sex      = sex
        self.dob      = dob
        self.dod      = dod
        self.wikilink = wikilink
        self.image    = image
        self.note     = note
        
    }
    
    enum CodingKeys : String, CodingKey {
        
        case idid = "_id"
        case name
        case species
        case sex
        case dob
        case dod
        case wikilink
        case image
        case note
        
    }
    
}

//
//  API.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 18/10/21.
//

import Foundation

struct API {
    
    let baseURL = "https://elephant-api.herokuapp.com"
    
    ///Returns the URL string to endpoint: /elephants
    func setElephantsURL() -> String {
        
        return "\(self.baseURL)/\(EndPoints.elephants)"
    }
    
    ///Return an array of Elefante -> If nil = []
    func getElephants(urlString: String, method: HTTPMethod) -> [Elefante] {
        
        //criar um array de elefante
        var arrayDeElefantes : [Elefante] = []
        
        
        //config sessao
        let config: URLSessionConfiguration = .default
        
        //sessao
        let session: URLSession = URLSession(configuration: config)
        
        //URL
        guard let url: URL = URL(string: urlString)
            else {
            return []
        }
        
        //URL Request
        var urlRequest: URLRequest = URLRequest(url: url)
        
        //URL Request -> Method (GET)
        urlRequest.httpMethod = "\(method)"
        
        //EXEC request HTTP
        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
          
            var statusCode: Int = 0
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            
            guard let data = result else { return } // precisa retornar o erro de DATA = nil
            
            do {
                //criar um decoder
                let decoder : JSONDecoder = JSONDecoder()
                
                //decodificar
                let decodeData: [Elefante] = try decoder.decode([Elefante].self, from: data)
                arrayDeElefantes = decodeData
                
            } catch {
                    //error
                }
        }
        )
        task.resume()
    
        return arrayDeElefantes
        }
}
    


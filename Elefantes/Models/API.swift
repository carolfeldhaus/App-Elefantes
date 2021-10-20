//
//  API.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 18/10/21.
//

import Foundation

/// API model
struct API {
    
    //aqui insere a URL da API
    let baseURL = "https://elephant-api.herokuapp.com"
    

    //aqui retorna todos os endpoints
    /// returns the string URL to Elephants endpoint
    func setElephantsURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)"
    }
    
    func setRandomElephantsURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)\(EndPoints.random)"
    }
    
    func setSexElephantsURL(_ sex: Sex) -> String {
        return "\(baseURL)/\(EndPoints.elephants)\(EndPoints.sex)\(sex)"
    }
    
    func setSpeciesElephantsURL(_ species: Species) -> String {
        return "\(baseURL)/\(EndPoints.elephants)\(EndPoints.species)\(species)"
    }
    
    func setNameElephantsURL(_ name: String) -> String {
        return "\(baseURL)/\(EndPoints.elephants)\(EndPoints.name)\(name)"
    }
    
    
/*
 FAZENDO SEM CLOSURE
 
 /// Returns an array of Elephant , but, If returns a empty array []
     func getElephants(urlString: String, method: HTTPMethod) -> [Elephant] {
 
         // Config da Sessão
         let config: URLSessionConfiguration = .default
 
         // Sessão
         let session: URLSession = URLSession(configuration: config)
 
         // URL
         guard let url: URL = URL(string: urlString) else { return [] }
 
         // URL Request
         var urlRequest: URLRequest = URLRequest(url: url)
 
         // Add Method GET to URL Request
         urlRequest.httpMethod = "\(method)"
 
         // Execute the Request HTTP    -> aqui fica a chamada/requisição da API
 
         var arrayElephants: [Elephant] = []
 
         let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
 
             var statusCode: Int = 0
             if let response = urlResponse as? HTTPURLResponse {
 
 
 
outra forma de fazer:
 
                 if response.statusCode >= 300 {
                     return
                 }
 
                 statusCode = response.statusCode
             }
 
             guard let data = result else { return } // precisa retornar o erro de DATA = nil
 
             // preciso fazer um try catch pois se der erro eu preciso retornar esse erro
             do {
                 // criar um decoder
                 let decoder: JSONDecoder = JSONDecoder()
 
                 // decodificar o retorno
                 arrayElephants = try decoder.decode([Elephant].self, from: data)
 
 
 outra forma de fazer (sem precisar criar um decoder):
 
                 arrayElephants = try JSONDecoder().decode([Elephant].self, from: data)
 
             } catch {
                 // error
                 print("deu erro")
             }
 
         })
 
         task.resume()
 
         sleep(2)
         return arrayElephants
 
 */
    
    
    //aqui configura o get COM CLOSURE
    func getElephants(urlString: String, method: HTTPMethods, response: @escaping ([Elefante]) -> Void, errorReturned: @escaping (String) -> Void ) {
        
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        guard let url: URL = URL(string: urlString) else { return }
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "\(method)"
       
        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
            var statusCode: Int = 0
            
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            
            guard let data = result else {
                
                errorReturned("Não retornou nada")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let decodableData: [Elefante] = try decoder.decode([Elefante].self, from: data)
                if decodableData.count < 1 {
                    errorReturned("Array de Elefantes é zero")
                }
                
                switch statusCode {
                case 200:
                    response(decodableData)
                case 404:
                    errorReturned("Página não encontrada")
                    return
                case 500:
                    errorReturned("Erro de servidor")
                    return
                default:
                    break
                }
                
            } catch {
                errorReturned("Erro de decodificacao")
            }
        })
        task.resume()
    }
    
}

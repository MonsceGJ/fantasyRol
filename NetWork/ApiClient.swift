//
//  ApiClient.swift
//  fantasyRole
//
//  Created by monscerrat gutierrez on 16/05/24.
//

import Foundation



import Foundation

class ApiClient {
    
    func searchinhabitant(query: String ,completion: @escaping (Result<[Brastlewark], Error>) -> Void) {
        let urlString = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL is not valid"])
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
            
        request.httpMethod = "GET"
        
            let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    if let error = error {
                        print("Error: \(error)")
                        
                    } else {
                        print("No data recived")
                    }
                    
                    return
                }
                print(String(data: data, encoding: .utf8)!)
                
                do {
                    let result = try JSONDecoder().decode([Brastlewark].self, from: data)
                    
                    completion(.success(result))
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(.failure(error))
                }
                
                
            }.resume()
        }
    }


//
//  APIHandler.swift
//  URLSESSIONPlay
//
//  Created by Nathaniel Whittington on 3/15/22.
//

import Foundation


class APIHandler{
    
    static let shared = APIHandler()
    private init () {}
    typealias CompletionHandler = ((Data?,Error?)->Void)
    
    func get(completion:@escaping (Result<Data,Error>)->Void){
        
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/comments" ) else {return}
        
        let task = URLSession.shared
        task.dataTask(with: url) {  data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }

            
        }.resume()
        
    }
    
}

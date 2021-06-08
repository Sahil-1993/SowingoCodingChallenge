//
//  NetworkManager.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-15.
//


import UIKit
import Foundation


final class NetworkManager: NSObject {
// MARK: Properties
//Shared Instance
static let shared = NetworkManager()

func loadData<T:Decodable>(request:URLRequest, completionHandler:@escaping((T?)-> Void)){
    URLSession.shared.dataTask(with: request, completionHandler: {(data,response,error) in
        guard let data = data, error == nil  else{
            print("sahil arora\(String(describing: error?.localizedDescription))")
            
            return
        }
        do{
            if let response = response as? HTTPURLResponse {
                print("response status code is \(response.statusCode)")
                switch response.statusCode {
                case 200:
                    let result = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(result)
                    }
                default:
                    break
                }
                
            }
        } catch {
            print("error is \(error.localizedDescription)")
            completionHandler(nil)
        }
    }).resume()
}
}

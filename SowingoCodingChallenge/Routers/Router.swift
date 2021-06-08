//
//  ProductRouter.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-15.
//

import Foundation

 enum APIRequest{
    case products
    case favorites
    case unfavourite
    
    var method: String {
        switch self {
        case .products:
            return "GET"
        case.favorites:
            return "POST"
        case .unfavourite:
            return "DELETE"
        }
    }
    var path: String {
        switch self {
        case .products:
            return "products"
        case .favorites,.unfavourite:
           return "favorites"
        }
    }
}

 func createURLRequest(requestType:APIRequest)->URLRequest{
   let baseUrl = "https://demo5514996.mockable.io/"
    var urlRequest = URLRequest(url: URL(string: baseUrl.appending(requestType.path))!)
        urlRequest.httpMethod = requestType.method
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
   return urlRequest
}

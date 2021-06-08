//
//  ProductNetworkController.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-15.
//

import Foundation

final class ProductNetworkController{
    private let decoder = JSONDecoder()
    private let networkManager = NetworkManager()
    
    public func retrieveProductList(completion: @escaping (ProductModel)-> Void){
        let request = createURLRequest(requestType: APIRequest.products)
        networkManager.loadData(request: request, completionHandler: {(data:ProductModel?) in
            guard let result = data else {return}
                        completion(result)
        })
    }
    public func markProductFavorite(isFav:Bool,completion: @escaping((_ response:FavouriteModel?)-> Void)){
        var request:APIRequest?
        if isFav{
            request = APIRequest.favorites
        }else {
             request = APIRequest.unfavourite
        }
        networkManager.loadData(request: createURLRequest(requestType: request!), completionHandler: {(data:FavouriteModel?) in
            guard let result  = data else{
                completion(nil)
                return
            }
            completion(result)
        })
    }
}

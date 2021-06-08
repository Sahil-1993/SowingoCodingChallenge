//
//  ProductViewModel.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-15.
//

import Foundation

final class ProductsViewModel {
    
    private var networkController: ProductNetworkController
    private var productsList = [ProductViewModel]()
    private var callback: (()->()) = { }
    private var productArray = [ProductViewModel]()
    
    // array initialized to store data if search  is performed alongside filter
    private var filteretdSearchArray = [ProductViewModel]()
    init(callback: @escaping(() -> ())) {
        
        networkController = ProductNetworkController()
        self.callback = callback
        
        //API Call
        networkController.retrieveProductList(completion: {(response) in
            self.productsList = response.hits.enumerated().compactMap({ (index, model)  in
               // print(model.actualImageURL)
                let obj = ProductViewModel(with: model)
                obj.isEnlarge = index < 3 ? true : false
                return obj
            })
            self.productArray = self.productsList
            callback()
        }) 
    }
    
    var getTotalProducts: Int {
        return productsList.count
    }
    //Method to update object of productList at specific indexpath
    public func updateFavProductAtIndex(with indexPath: IndexPath, callback: (()->())) {
        productsList[indexPath.row].isFavoriteProduct = !productsList[indexPath.row].isFavoriteProduct
        callback()
    }
    //Method to retrieve product at particular indexPath of tableview
    public func getProductAtIndex(with indexPath: IndexPath) -> ProductViewModel {
        return productsList[indexPath.row]
    }
    //Method to implement search on productList
    public func searchProduct(searchText: String){
        if searchText == "" {
            //check if search is performed with filter ON
            if filteretdSearchArray.count != 0 {
                self.productsList = self.filteretdSearchArray
            } else{
                
                self.productsList = productArray
            }
        } else {
            if  filteretdSearchArray.count !=  0 {
                self.productsList = self.filteretdSearchArray.filter({$0.name.contains(searchText)})
            }else{
                self.productsList = productArray.filter({$0.name.contains(searchText)})
            }
            
        }
    }
    //Method to implement filter on productList
    public func filterProduct(isFilter: Bool){
        if isFilter{
            self.productsList = productsList.filter({$0.isFavoriteProduct})
            self.filteretdSearchArray = self.productsList
        }else {
            self.productsList = productArray
            self.filteretdSearchArray = []
        }
    }
    
    public func tapFavourite(indexPath:IndexPath,completion: @escaping((_ result:FavouriteModel?)->Void)){
        let favValue = getProductAtIndex(with: indexPath).isFavoriteProduct
        
        networkController.markProductFavorite(isFav: favValue, completion: {(data) in
            completion(data)
        })
        
    }
}




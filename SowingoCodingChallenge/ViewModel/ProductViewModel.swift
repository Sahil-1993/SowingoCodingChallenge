//
//  Product.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-16.
//

import Foundation

final class ProductViewModel{
    
    let manufacturerName:String
    var isFavoriteProduct:Bool
    let badgeImageUrl:String
    let mainImageUrl:URL?
    let listPrice:Double
    let yourPrice:Double
    let description:String
    let subCategoryName:String!
    var isEnlarge: Bool = false
    let name:String
    
    init(with model: ProductModel.Hit){
        manufacturerName = model.filters?.manufacturerName ?? ""
        isFavoriteProduct = model.isFavouriteProduct
        badgeImageUrl = model.advertisingBadges.badges?.first?.badgeImageUrl ?? ""
        mainImageUrl = model.actualImageURL
        listPrice = model.vendorInventory.first?.listPrice ?? 0.0
        yourPrice = model.vendorInventory.first?.price ?? 0.0
        subCategoryName = model.subcategory.name
        description = model.description
        name = model.name
    }
}

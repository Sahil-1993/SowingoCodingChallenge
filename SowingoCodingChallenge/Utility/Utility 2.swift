//
//  Utility.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-14.
//

import Foundation
import UIKit


struct ColorCode {
    static let filterViewBorderColor = UIColor(red: 202/255, green: 210/255, blue: 216/255, alpha: 1)
    static let cellViewBorderColor = UIColor(red: 171/255, green: 185/255, blue: 196/255, alpha: 1)
    static let cellImageViewBackgroundColor = UIColor(red: 0.882, green: 0.902, blue: 0.918, alpha: 1)
    static let filterViewColor = UIColor(red: 57/255, green: 141/255, blue: 227/255, alpha: 1.0)

}                               
struct Images {
    static let emptyFilterImage = UIImage(named: "emptyFilter")
    static let FilterImage = UIImage(named: "filter")
    static let defaultFavouriteImage = UIImage(named: "defaultFavourite")
    static let favouriteImage = UIImage(named: "favourite")
    static let bestSellerLabelImage = UIImage(named: "bestSeller")
    static let placeholderImage = UIImage(named: "placeholder")
}
struct cellIdentifier {
    static let largerCell = "FeaturedCell"
    static let smallerCell = "ProductCell"
}
struct FilterLabelText {
    static let filterdLabel = "Filter(1)"
    static let noFilterdLabel = "Filter"
}
struct AlertMessages{
    static let InternetConnectionMessage = "Check Internet Connection"
    static let RemoveFilterMessage = "Pull to refresh the list of products"
}
enum APIEndpoint: String{
    case  products  = "products"
    case  favorites = "favorites"
}

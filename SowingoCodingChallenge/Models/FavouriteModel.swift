//
//  Favourite.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-17.
//

import Foundation

struct FavouriteModel: Codable {
    let favorite: Bool
    private  enum CodingKeys:String, CodingKey{
        case favorite = "favorite"
    }
}

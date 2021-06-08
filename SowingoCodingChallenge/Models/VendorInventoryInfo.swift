//
//  VendorInventory.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-16.
//

import Foundation

struct VendorInventoryInfo: Codable {
    struct VendorInventoryId: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let vendorInventoryId: VendorInventoryId
    struct Price: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let price: Price
    struct VendorSku: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let vendorSku: VendorSku
    private enum CodingKeys: String, CodingKey {
        case vendorInventoryId = "vendor_inventory_id"
        case price
        case vendorSku = "vendor_sku"
    }
}
struct ParentCategory: Codable {
    let id: String
    let name: String
}

//
//  Highlights.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-16.
//

import Foundation

struct HighlightResult: Codable {
    struct Subcategory: Codable {
        struct Id: Codable {
            let matchLevel: String
            let value: String
            let matchedWords: [String]
        }
        let id: Id
        struct Name: Codable {
            let matchLevel: String
            let value: String
            let matchedWords: [String]
        }
        let name: Name
    }
    let subcategory: Subcategory
    struct MarketplaceId: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let marketplaceId: MarketplaceId
    let vendorInventory: VendorInventoryInfo
    struct ParentCategory: Codable {
        struct Id: Codable {
            let matchLevel: String
            let value: String
            let matchedWords: [String]
        }
        let id: Id
        struct Name: Codable {
            let matchLevel: String
            let value: String
            let matchedWords: [String]
        }
        let name: Name
    }
    let parentCategory: ParentCategory
    struct MedicalFieldId: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let medicalFieldId: MedicalFieldId
    struct Name: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let name: Name
    struct Manufacturer: Codable {
        struct Sku: Codable {
            let matchLevel: String
            let value: String
            let matchedWords: [String]
        }
        let sku: Sku
        struct Id: Codable {
            let matchLevel: String
            let value: String
            let matchedWords: [String]
        }
        let id: Id
        struct Name: Codable {
            let matchLevel: String
            let value: String
            let matchedWords: [String]
        }
        let name: Name
    }
    let manufacturer: Manufacturer
    struct Id: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let id: Id
    struct Description: Codable {
        let matchLevel: String
        let value: String
        let matchedWords: [String]
    }
    let description: Description
    private enum CodingKeys: String, CodingKey {
        case subcategory
        case marketplaceId = "marketplace_id"
        case vendorInventory = "vendor_inventory"
        case parentCategory = "parent_category"
        case medicalFieldId = "medical_field_id"
        case name
        case manufacturer
        case id
        case description
    }
}

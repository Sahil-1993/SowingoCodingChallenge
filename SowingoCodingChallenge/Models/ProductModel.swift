//
//  ProductModel.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-14.
//


import Foundation
import UIKit

struct ProductModel: Codable {
    struct Hit: Codable {
        let unitName: String
        struct Subcategory: Codable {
            let id: String
            let name: String
        }
        let subcategory: Subcategory
        let objectID: String
        let medicalFieldId: String
        let contentPerUnit: String
        let filters: Filters?
        let images: [Image]
        let onHand: Int?
        let id: String
        let mainImage240Box: String?
        let barcodes: String?
        let vendorInventory: [VendorInventory]
        let countryId: String
        let trackingMethod: String?
        let isFavouriteProduct: Bool
        let advertisingBadges: AdvertisingBadges
        let orderPackageQuantity: Int?
        let description: String
        let marketplaceId: String
        let parentCategory: ParentCategory
        let highlightResult: HighlightResult
        let buyByCase: Bool?
        let minimumLevel: Int?
        let manufacturerSku: String
        struct Manufacturer: Codable {
            let sku: String
            let id: String
            let name: String
        }
        let manufacturer: Manufacturer
        let mainImage: String?
        let name: String
        let sdsUrl: [String]?
        let officeInventoryItemId: String?
        let itemType: String?
        let mainImage240Wide: String?
        let idd: String
        private enum CodingKeys: String, CodingKey {
            case unitName = "unit_name"
            case subcategory
            case objectID
            case medicalFieldId = "medical_field_id"
            case contentPerUnit = "content_per_unit"
            case filters
            case images
            case onHand = "on_hand"
            case id
            case mainImage240Box = "main_image_240_box"
            case barcodes
            case vendorInventory = "vendor_inventory"
            case countryId = "country_id"
            case trackingMethod = "tracking_method"
            case isFavouriteProduct = "is_favourite_product"
            case advertisingBadges = "advertising_badges"
            case orderPackageQuantity = "order_package_quantity"
            case description
            case marketplaceId = "marketplace_id"
            case parentCategory = "parent_category"
            case highlightResult = "_highlightResult"
            case buyByCase = "buy_by_case"
            case minimumLevel = "minimum_level"
            case manufacturerSku = "manufacturer_sku"
            case manufacturer
            case mainImage = "main_image"
            case name
            case sdsUrl = "sds_url"
            case officeInventoryItemId = "office_inventory_item_id"
            case itemType = "item_type"
            case mainImage240Wide = "main_image_240_wide"
            case idd = "_id"
        }
    }
    let hits: [Hit]
}
struct VendorInventory: Codable {
    struct Promotion: Codable {
        struct PromotionProperties: Codable {
            let buy: Int
            let get: Int
        }
        let promotionProperties: PromotionProperties
        let effectivePrice: Double
        let endDate: String
        let promotionNotes: String
        let id: String
        let promotionType: String
        let startDate: String
        private enum CodingKeys: String, CodingKey {
            case promotionProperties = "promotion_properties"
            case effectivePrice = "effective_price"
            case endDate = "end_date"
            case promotionNotes = "promotion_notes"
            case id
            case promotionType = "promotion_type"
            case startDate = "start_date"
        }
    }
    let promotions: [Promotion]?
    let vendorInventoryId: String
    let listPrice: Double
    let marketplaceId: String
    let price: Double
    let specialFee: String
    let specialFeeAmount: String?
    let vendorSku: String
    let hasPromotions: Bool
    struct Vendor: Codable {
        let image: String
        let isActive: Bool
        let id: String
        let name: String
        private enum CodingKeys: String, CodingKey {
            case image
            case isActive = "is_active"
            case id
            case name
        }
    }
    let vendor: Vendor
    let isPublished: Bool
    private enum CodingKeys: String, CodingKey {
        case promotions
        case vendorInventoryId = "vendor_inventory_id"
        case listPrice = "list_price"
        case marketplaceId = "marketplace_id"
        case price
        case specialFee = "special_fee"
        case specialFeeAmount = "special_fee_amount"
        case vendorSku = "vendor_sku"
        case hasPromotions = "has_promotions"
        case vendor
        case isPublished = "is_published"
    }
}
struct Image: Codable {
    let image240Wide: String?
    let image: String?
    let image240Box: String?
    let mainImageBool: Bool
    private enum CodingKeys: String, CodingKey {
        case image240Wide = "image_240_wide"
        case image
        case image240Box = "image_240_box"
        case mainImageBool = "main_image_bool"
    }
}

extension ProductModel.Hit {
    var actualImageURL: URL? {
        guard let imageString = mainImage else {return nil}
        return URL(string: imageString)
    }
}

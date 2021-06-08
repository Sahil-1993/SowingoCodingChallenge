//
//  Filters.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-16.
//

import Foundation

struct Filters: Codable {
    let manufacturerName: String?
    let promotableItemUs: String
    let stepApproved: String
    let packageQuantity: String?
    let webClassification: String
    let totalVolume: String?
    let caseQuantity: String?
    let enrichedMktgBasic: String?
    let promotableItemCa: String
    let enrichedVendor: String?
    let lightTipSize: String?
    let bodyColor: String?
    let rechargeability: String?
    let powerSource: String?
    let lightType: String?
    let batteryType: String?
    let minimumLightWavelength: String?
    let lightSpectrum: String?
    let maximumLightWavelength: String?
    let bodyColorFamily: String?
    let containerDimensions: String?
    let language: String?
    let lidType: String?
    let containerSize: String?
    let warningLabel: String?
    let numberOfLidOpenings: String?
    let colorFamily: String?
    let containerColor: String?
    let lidColor: String?
    let mountType: String?
    let color: String?
    let productType: String?
    let maskConstruction: String?
    let maskType: String?
    let fiberglassContent: String?
    let standardsMet: String?
    let productForm: String?
    let mixingAmount: String?
    let safetyEnvironmentalFeatures: String?
    let overallDiameter: String?
    let overallLength: String?
    private enum CodingKeys: String, CodingKey {
        case manufacturerName = "Manufacturer Name"
        case promotableItemUs = "Promotable Item Us"
        case stepApproved = "Step Approved"
        case packageQuantity = "Package Quantity"
        case webClassification = "Web Classification"
        case totalVolume = "Total Volume"
        case caseQuantity = "Case Quantity"
        case enrichedMktgBasic = "Enriched, Mktg Basic"
        case promotableItemCa = "Promotable Item Ca"
        case enrichedVendor = "Enriched, Vendor"
        case lightTipSize = "Light Tip Size"
        case bodyColor = "Body Color"
        case rechargeability = "Rechargeability"
        case powerSource = "Power Source"
        case lightType = "Light Type"
        case batteryType = "Battery Type"
        case minimumLightWavelength = "Minimum Light Wavelength"
        case lightSpectrum = "Light Spectrum"
        case maximumLightWavelength = "Maximum Light Wavelength"
        case bodyColorFamily = "Body Color Family"
        case containerDimensions = "Container Dimensions"
        case language = "Language"
        case lidType = "Lid Type"
        case containerSize = "Container Size"
        case warningLabel = "Warning Label"
        case numberOfLidOpenings = "Number Of Lid Openings"
        case colorFamily = "Color Family"
        case containerColor = "Container Color"
        case lidColor = "Lid Color"
        case mountType = "Mount Type"
        case color = "Color"
        case productType = "Product Type"
        case maskConstruction = "Mask Construction"
        case maskType = "Mask Type"
        case fiberglassContent = "Fiberglass Content"
        case standardsMet = "Standards Met"
        case productForm = "Product Form"
        case mixingAmount = "Mixing Amount"
        case safetyEnvironmentalFeatures = "Safety & Environmental Features"
        case overallDiameter = "Overall Diameter"
        case overallLength = "Overall Length"
    }
}

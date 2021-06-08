//
//  AdvertisingBadges.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-16.
//

import Foundation

struct AdvertisingBadges: Codable {
    let hasBadge: Bool
    struct Badge: Codable {
        let badgeType: String
        let badgeImageUrl: String
        private enum CodingKeys: String, CodingKey {
            case badgeType = "badge_type"
            case badgeImageUrl = "badge_image_url"
        }
    }
    let badges: [Badge]?
    private enum CodingKeys: String, CodingKey {
        case hasBadge = "has_badge"
        case badges
    }
}

//
//  HomeModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import Foundation

struct HomeModel: Decodable {
	var homeStore: [HomeStore]
	var bestSeller: [BestSeller]

	enum CodingKeys: String, CodingKey {
		case homeStore = "home_store"
		case bestSeller = "best_seller"
	}
}

struct HomeStore: Decodable, Identifiable {
	var id: Int
	var isNew: Bool?
	var title, subtitle: String
	var picture: String
	var isBuy: Bool

	enum CodingKeys: String, CodingKey {
		case id
		case isNew = "is_new"
		case title, subtitle, picture
		case isBuy = "is_buy"
	}
}

struct BestSeller: Decodable, Identifiable {
	var id: Int
	var isFavorites: Bool
	var title: String
	var priceWithoutDiscount, discountPrice: Int
	var picture: String

	enum CodingKeys: String, CodingKey {
		case id
		case isFavorites = "is_favorites"
		case title
		case priceWithoutDiscount = "price_without_discount"
		case discountPrice = "discount_price"
		case picture
	}
}


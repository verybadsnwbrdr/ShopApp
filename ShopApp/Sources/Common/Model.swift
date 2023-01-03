//
//  MainModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import Foundation

struct Model: Identifiable {
	var id = UUID()
	var text: String
	
}

extension Model {
	static let mock = [
		Model(text: "Test")
	]
}

struct HomeStore: Codable {
	var id: Int
	var isNew: Bool?
	var title: String
	var subTitle: String
	var picture: String
	var isBuy: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case isNew = "is_new"
		case title
		case subTitle
		case picture
		case isBuy = "is_buy"
	}
}

struct BestSeller: Codable {
	let id: Int
	let isFavorites: Bool
	let title: String
	let priceWithoutDiscount: Int
	let discountPrice: Int
	let picture: String

	enum CodingKeys: String, CodingKey {
		case id
		case isFavorites = "is_favorites"
		case title
		case priceWithoutDiscount = "price_without_discount"
		case discountPrice = "discount_price"
		case picture
	}
}

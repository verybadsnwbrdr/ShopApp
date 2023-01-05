//
//  MainModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import Foundation

struct Model: Codable {
	let homeStore: [HomeStore]
	let bestSeller: [BestSeller]

	enum CodingKeys: String, CodingKey {
		case homeStore = "home_store"
		case bestSeller = "best_seller"
	}
}

struct HomeStore: Codable {
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

struct BestSeller: Codable {
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

extension BestSeller {
	static var mock = [
		BestSeller(id: 2,
				   isFavorites: true,
				   title: "Samsung Galaxy s20 Ultr",
				   priceWithoutDiscount: 1500,
				   discountPrice: 1047,
				   picture: "asd")
	]
}

extension HomeStore {
	static var mock = [
		HomeStore(id: 1,
				  isNew: true,
				  title: "Iphone 12",
				  subtitle: "dasd",
				  picture: "asd",
				  isBuy: true)
	]
}

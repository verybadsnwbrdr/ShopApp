//
//  CartModel.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import Foundation

struct CartModel: Decodable {
	var basket: [Basket] = []
	var delivery: String = String()
	var id: String = String()
	var total: Int = 0
}

struct Basket: Decodable, Identifiable {
	var id: Int
	var images: String
	var price: Int
	var title: String
}

//
//  CartModel.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import Foundation

struct CartModel: Identifiable {
	var id = UUID()
	var name: String
	var picture: String
	var price: Int
//	var finalPrice: Int = 0
	var finalPrice: Int { price * number }
	var deliveryPrice: Int?
	var number: Int
//	{
//		willSet {
//			finalPrice = price * newValue
//		}
//	}
}

extension CartModel {
	static var mockModel = CartModel(name: "Samsung",
									 picture: "",
									 price: 1500,
//									 finalPrice: 3000,
									 number: 2)
}

//
//  DetailModel.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import Foundation

struct DetailModel: Codable {
	let cpu, camera: String
	let capacity, color: [String]
	let id: String
	var images: [String]
	let isFavorites: Bool
	let price: Int
	let rating: Double
	let sd, ssd, title: String

	enum CodingKeys: String, CodingKey {
		case cpu = "CPU"
		case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
	}
}

//
//  DetailModel.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import Foundation

struct DetailModel: Codable {
	var cpu, camera: String
	var capacity, color: [String]
	var id: String
	var images: [String]
	var isFavorites: Bool
	var price: Int
	var rating: Double
	var sd, ssd, title: String

	enum CodingKeys: String, CodingKey {
		case cpu = "CPU"
		case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
	}
}

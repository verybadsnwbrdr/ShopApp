//
//  HomeScreenModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import Foundation

struct HomeScreenModel {
	var isSelected: Bool = false
	var category: String
	var image: Images
}

extension HomeScreenModel {
	static var mockModels: [HomeScreenModel] = [
		HomeScreenModel(isSelected: true, category: "Phone", image: .phone),
		HomeScreenModel(category: "Computer", image: .computer),
		HomeScreenModel(category: "Health", image: .health),
		HomeScreenModel(category: "Books", image: .books),
		HomeScreenModel(category: "Random", image: .health)
	]
}

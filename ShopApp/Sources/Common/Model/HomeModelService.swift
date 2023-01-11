//
//  HomeModelService.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import Foundation

final class HomeModelService: Fetchable {
	@Published var model: HomeModel

	init() {
		model = HomeModel.init(homeStore: [], bestSeller: [])
	}
}

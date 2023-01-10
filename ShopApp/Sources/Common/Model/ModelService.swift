//
//  ModelService.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import Foundation

final class ModelService: Fetchable {
	@Published var model: Model

	init() {
		model = Model.init(homeStore: [], bestSeller: [])
	}
}

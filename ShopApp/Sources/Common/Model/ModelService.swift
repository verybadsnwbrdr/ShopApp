//
//  ModelService.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import Foundation
import Combine

final class ModelService: FetchableProtocol {
	@Published var model: Model

	init() {
		model = Model.init(homeStore: [], bestSeller: [])
	}
//	
//	fetch() {
//		fetch(from: EndPoint.homeURL.optionalURL)
//			.receive(on: RunLoop.main)
//			.assign(to: &$model)
//	}
}

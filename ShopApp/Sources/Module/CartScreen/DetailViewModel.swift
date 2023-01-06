//
//  CartViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import Foundation

class DetailViewModel: ObservableObject, Identifiable {
	
	private unowned let coordinator: CoordinatorObject
	@Published var modelService: DetailModelService
	@Published var model: DetailModel = DetailModel(cpu: "", camera: "", capacity: [], color: [], id: "", images: [], isFavorites: false, price: 1, rating: 1, sd: "", ssd: "", title: "")
	
	init(coordinator: CoordinatorObject, modelService: DetailModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		modelService.fetchBestSeller { detailModel in
			self.model = detailModel
		}
//		self.model = modelService.fetchData("https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5")
		
	}
	
	func close() {
		coordinator.close()
	}
	
}

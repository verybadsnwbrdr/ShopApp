//
//  CartViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

class DetailViewModel: ObservableObject, Identifiable {
	
	private unowned let coordinator: CoordinatorObject
	@Published var modelService: DetailModelService
	@Published var model: DetailModel?
	
	init(coordinator: CoordinatorObject, modelService: DetailModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		
//		self.model = modelService.fetchData("https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5")
		
	}
	
	func fetch() {
		modelService.fetchBestSeller { [unowned self] detailModel in
			self.model = detailModel
		}
	}
	
	func previousScreen() {
		coordinator.previousScreen()
	}
	
	func makeFavourite() {
		self.model?.isFavorites.toggle()
	}
	
	func selectColor(_ color: String) {
		
	}
	
	func openCart() {
		self.coordinator.open(.cart)
	}
	
	func addToCart(_ model: DetailModel) {
		let outputModel = CartModel(name: model.title,
									picture: model.images.first!,
									price: model.price,
									number: 1)
		self.coordinator.addToCard(outputModel)
	}
}

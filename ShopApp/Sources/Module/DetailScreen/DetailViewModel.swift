//
//  CartViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI
import Combine

final class DetailViewModel: ObservableObject, Identifiable {

	private unowned let coordinator: CoordinatorObject
	@Published var modelService: DetailModelService
	@Published var model: DetailModel?
	
	init(coordinator: CoordinatorObject, modelService: DetailModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		fetch()
	}
	
	func fetch() {
		modelService.fetch(from: EndPoint.detailURL.optionalURL)
			.receive(on: RunLoop.main)
			.assign(to: &$model)
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
	
//	func addToCart(_ model: DetailModel) {
//		let outputModel = CartModel(name: model.title,
//									picture: model.images.first!,
//									price: model.price,
//									number: 1)
//		self.coordinator.addToCard(outputModel)
//	}
	
	func addToCart() {
		self.coordinator.addToCard()
	}
}

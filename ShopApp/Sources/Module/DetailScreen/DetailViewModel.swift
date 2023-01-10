//
//  CartViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

final class DetailViewModel: ObservableObject, Identifiable {

	private unowned let coordinator: CoordinatorObject
	@Published private var modelService: DetailModelService
	@Published private(set) var model: DetailModel?
	
	init(coordinator: CoordinatorObject, modelService: DetailModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		fetch()
	}
	
	private func fetch() {
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
	
	func addToCart() {
		self.coordinator.addToCard()
	}
}

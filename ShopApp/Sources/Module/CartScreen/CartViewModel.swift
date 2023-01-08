//
//  CartViewModel.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

final class CartViewModel: ObservableObject {
	private unowned let coordinator: CoordinatorObject
	@Published var modelService: CartModelService
	@Published var models: [CartModel] {
		didSet {
			totalPrice = models.map { $0.price }.reduce(0, +)
			count = models.count
		}
	}
	@Published var totalPrice: Int = 0
	@Published var count: Int = 0
	
	init(coordinator: CoordinatorObject,
		 modelService: CartModelService,
		 models: [CartModel]) {
		self.coordinator = coordinator
		self.modelService = modelService
		self.models = models
	}
	
	func previousScreen() {
		self.coordinator.previousScreen()
	}
	
	func selectAdress() {
		
	}
	
	func addToCart(_ model: CartModel) {
		self.modelService.addToCart(model)
	}
	
	func removeFromCart(_ id: UUID) {
		self.modelService.removeFromCart(id)
	}
	
	func removeAll() {
		self.modelService.removeAll()
	}
}




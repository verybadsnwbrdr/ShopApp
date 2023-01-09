//
//  CartViewModel.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI
import Combine

final class CartViewModel: ObservableObject {
	
	private unowned let coordinator: CoordinatorObject
	private var cancellable: AnyCancellable?
	
	@ObservedObject var modelService: CartModelService
	
	@Published private(set) var models: [CartModel] = []
	@Published private(set) var totalPrice: Int = 0
	@Published private(set) var count: Int = 0
	

	init(coordinator: CoordinatorObject,
		 modelService: CartModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		fetch()
	}
	
	private func fetch() {
		cancellable = modelService.$models
			.sink { [unowned self] models in
				self.models = models
				totalPrice = models.map { $0.finalPrice }.reduce(0, +)
				count = models.map { $0.number }.reduce(0, +)
			}
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

	func increment(_ id: UUID) {
		self.modelService.increment(id)
	}
	
	func decrement(_ id: UUID) {
		self.modelService.decrement(id)
	}
}




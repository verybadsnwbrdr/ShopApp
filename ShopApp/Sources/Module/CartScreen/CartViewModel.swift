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
	
	@ObservedObject private var modelService: CartModelService
	@Published private(set) var model: CartModel
	

	init(coordinator: CoordinatorObject,
		 modelService: CartModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		self.model = modelService.model
		fetch()
	}
	
	private func fetch() {
		cancellable = modelService.$model
			.sink { [unowned self] model in
				self.model = model
			}
	}
	
	func previousScreen() {
		self.coordinator.previousScreen()
	}
	
	func selectAdress() {
		
	}
	
	func addToCart(_ model: Basket) {
		self.modelService.addToCart(model)
	}

	func delete(_ model: Basket) {
		self.modelService.deleteOne(model)
	}
	
	func buy() {
		self.modelService.removeAll()
	}
	
	func add() {
		self.modelService.add()
	}
}

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
	@ObservedObject var modelService: CartModelService
	@Published var models: [CartModel] = []
	
	@Published var totalPrice: Int = 0
	@Published var count: Int = 0


	init(coordinator: CoordinatorObject,
		 modelService: CartModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
//		self.models = modelService.models
//			.sink(receiveValue: { <#[CartModel]#> in
//				<#code#>
//			})
			
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
	
	func add() {
		models.append(.mockModel)
	}
}




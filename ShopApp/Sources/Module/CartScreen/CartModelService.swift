//
//  CartService.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import Foundation
import Combine

final class CartModelService: ObservableObject {
	@Published var models: [CartModel] = []
	
	func addToCart(_ model: CartModel) {
		models.append(model)
	}
	
	func removeFromCart(_ id: UUID) {
		models.removeAll { $0.id == id }
	}
	
	func increment(_ id: UUID) {
		for i in models.indices {
			if models[i].id == id {
				models[i].number += 1
			}
		}
	}
	
	func decrement(_ id: UUID) {
		for i in models.indices {
			if models[i].id == id {
				guard models[i].number > 1 else {
					removeFromCart(id)
					return
				}
				models[i].number -= 1
			}
		}
	}
	
	func removeAll() {
		self.models.removeAll()
	}
}

//
//  CartService.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import Foundation
import Combine

final class CartModelService: ObservableObject, Fetchable {
	
	@Published var model: CartModel
	
	init() {
		self.model = CartModel()
	}
	
	func addToCart(_ model: Basket) {
		self.model.basket.append(model)
		self.model.total += model.price
	}
	
	func add() {
		fetch(from: EndPoint.cartURL.optionalURL)
			.assign(to: &$model)
	}
	
	func deleteOne(_ model: Basket) {
		guard self.model.basket.filter({ $0.id == model.id }).count > 0 else { return }
		for i in self.model.basket.indices {
			if self.model.basket[i].id == model.id {
				let deleted = self.model.basket.remove(at: i)
				self.model.total -= deleted.price
				return
			}
		}
	}
	
	func removeAll() {
		self.model.basket.removeAll()
		self.model.total = 0
	}
}

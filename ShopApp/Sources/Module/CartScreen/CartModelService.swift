//
//  CartService.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import Foundation
import Combine

class CartModelService: ObservableObject {
	@Published var models: [CartModel] = []
	
	func addToCart(_ model: CartModel) {
		models.append(model)
	}
	
	func removeFromCart(_ id: UUID) {
		models.removeAll { $0.id == id }
	}
	
	func removeAll() {
		models.removeAll()
	}
	
	let publisher = PassthroughSubject<[CartModel], Never>()
	private(set) var modelsS: [CartModel] = [] {
		didSet { publisher.send(modelsS)}
	}
	
}

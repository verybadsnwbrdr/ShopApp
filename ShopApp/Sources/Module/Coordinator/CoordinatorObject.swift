//
//  CoordinatorObject.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum CoordinatorTab: Hashable {
	case detail
	case cart
}

class CoordinatorObject: ObservableObject {
	//DELETE
	static var shared = CoordinatorObject(modelService: ModelService(), cartModelService: CartModelService())
	//DELETE

	@Published var homeViewModel: HomeViewModel!
	@Published var detailViewModel: DetailViewModel?
	@Published var filterViewModel: FilterViewModel?
	@Published var cartViewModel: CartViewModel?
	
	private let modelService: ModelService
	private let cartModelService: CartModelService
	@Published var path = [CoordinatorTab]()
	
	init(modelService: ModelService, cartModelService: CartModelService) {
		self.modelService = modelService
		self.cartModelService = cartModelService
		self.homeViewModel = .init(coordinator: self)
	}
	
	func open(_ item: CoordinatorTab) {
		self.detailViewModel = .init(coordinator: self, modelService: DetailModelService())
		path.append(item)
	}
	
	func previousScreen() {
		path.removeLast()
	}
	
	func openFilter() {
		self.filterViewModel = .init(coordinator: self)
	}
	
	func closeFilter() {
		self.filterViewModel = nil
	}
	
	func openCart() {
		self.cartViewModel = .init(coordinator: self,
								   modelService: self.cartModelService,
								   models: [CartModel.mockModel])
		path.append(.cart)
	}
	
	func homeScreen() {
		path.removeAll()
		
	}
}

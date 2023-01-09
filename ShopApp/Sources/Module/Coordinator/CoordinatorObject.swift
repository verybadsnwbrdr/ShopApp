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
	@Published var cartViewModel: CartViewModel!
	
	private let modelService: ModelService
	@Published var path = [CoordinatorTab]()
	
	init(modelService: ModelService, cartModelService: CartModelService) {
		self.modelService = modelService
		self.homeViewModel = .init(coordinator: self)
		self.cartViewModel = .init(coordinator: self, modelService: CartModelService())
	}
	
	func open(_ item: CoordinatorTab) {
		self.detailViewModel = .init(coordinator: self, modelService: DetailModelService())
		path.append(item)
	}
	
	func openScreen(_ tab: CoordinatorTab) -> AnyView  {
		switch tab {
		case .detail:
			return AnyView(DetailView(viewModel: detailViewModel!))
		case .cart:
			return AnyView(CartView(viewModel: cartViewModel!))
		}
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
		path.append(.cart)
	}
	
	func homeScreen() {
		path.removeAll()
	}
	
	func addToCard() {
		self.cartViewModel.addToCart(.init(name: "test", picture: "sasd", price: 1500, number: 1))
	}
}

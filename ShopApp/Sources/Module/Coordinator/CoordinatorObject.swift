//
//  CoordinatorObject.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum CoordinatorTab: Hashable {
	case home
	case detail
	case cart
	case another
}

class CoordinatorObject: ObservableObject {
	//DELETE
	static var shared = CoordinatorObject(modelService: ModelService(),
										  cartModelService: CartModelService(),
										  detailModelService: DetailModelService())
	//DELETE

	@Published var homeViewModel: HomeViewModel!
	@Published var detailViewModel: DetailViewModel!
	@Published var filterViewModel: FilterViewModel?
	@Published var cartViewModel: CartViewModel!
	
	private let modelService: ModelService
	@Published var path: [CoordinatorTab] = []
	
	init(modelService: ModelService,
		 cartModelService: CartModelService,
		 detailModelService: DetailModelService) {
		self.modelService = modelService
		self.homeViewModel = .init(coordinator: self)
		self.cartViewModel = .init(coordinator: self, modelService: cartModelService)
		self.detailViewModel = .init(coordinator: self, modelService: detailModelService)
	}
	
	func open(_ item: CoordinatorTab) {
		path.append(item)
	}
	
	func destination(_ tab: CoordinatorTab) -> AnyView  { 
		switch tab {
		case .detail:
			return AnyView(DetailView(viewModel: detailViewModel!))
		case .cart:
			return AnyView(CartView(viewModel: cartViewModel!))
		default:
			return AnyView(EmptyView())
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
	
	func homeScreen() {
		path.removeAll()
	}
	
	func addToCard(_ model: CartModel) {
		self.cartViewModel.addToCart(model)
	}
}

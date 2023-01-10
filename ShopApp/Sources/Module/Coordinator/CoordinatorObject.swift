//
//  CoordinatorObject.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI
import Combine

enum CoordinatorTab: Hashable {
	case home
	case detail
	case cart
	case another
}

class CoordinatorObject: ObservableObject {
	
	var homeViewModel: HomeViewModel!
	var detailViewModel: DetailViewModel!
	var cartViewModel: CartViewModel!
	
	@Published var filterViewModel: FilterViewModel?
	@Published var path: [CoordinatorTab] = []
	
	init(modelService: ModelService,
		 cartModelService: CartModelService,
		 detailModelService: DetailModelService) {
		self.homeViewModel = .init(coordinator: self, modelService: modelService)
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
	
	func addToCard() {
		self.cartViewModel.add()
	}
}

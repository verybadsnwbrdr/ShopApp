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

final class CoordinatorObject: ObservableObject {
	
	// MARK: - ViewModels
	private(set) var homeViewModel: HomeViewModel!
	@Published var filterViewModel: FilterViewModel?
	
	// MARK: - ModelServices
	private(set) var detailModelService: DetailModelService
	private(set) var cartModelService: CartModelService

	@Published var path: [CoordinatorTab] = []
	
	init(modelService: HomeModelService,
		 cartModelService: CartModelService,
		 detailModelService: DetailModelService) {
		self.detailModelService = detailModelService
		self.cartModelService = cartModelService
		self.homeViewModel = .init(coordinator: self, modelService: modelService)
	}
	
	// MARK: - Methods
	
	func addToCard() {
		self.cartModelService.add()
	}
}

// MARK: - Navigation Methods

extension CoordinatorObject {
	
	func open(_ item: CoordinatorTab) {
		path.append(item)
	}
	
	func destination(_ tab: CoordinatorTab) -> AnyView?  {
		switch tab {
		case .detail:
			let viewModel = DetailViewModel(coordinator: self, modelService: detailModelService)
			return AnyView(DetailView(viewModel: viewModel))
		case .cart:
			let viewModel = CartViewModel(coordinator: self, modelService: cartModelService)
			return AnyView(CartView(viewModel: viewModel))
		default:
			return nil
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
}

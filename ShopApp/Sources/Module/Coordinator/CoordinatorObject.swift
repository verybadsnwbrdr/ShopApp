//
//  CoordinatorObject.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum CoordinatorTab: Hashable {
//	case home
	case detail
	case bag
}

class CoordinatorObject: ObservableObject {
	
//	@Published var tab = CoordinatorTab.home
	@Published var homeViewModel: HomeViewModel!
	@Published var detailViewModel: DetailViewModel?
	@Published var filterViewModel: FilterViewModel?
	
	private let modelService: ModelService
	@Published var path = [CoordinatorTab]()
	
	init(modelService: ModelService) {
		self.modelService = modelService
		self.homeViewModel = .init(coordinator: self)
	}
	
	func open(_ item: CoordinatorTab) {
		self.detailViewModel = .init(coordinator: self, modelService: DetailModelService())
		path.append(item)
	}
	
	func close() {
		path.removeLast()
	}
	
	func openFilter() {
		self.filterViewModel = .init(coordinator: self)
	}
	
	func closeFilter() {
		self.filterViewModel = nil
	}
	
//	func select(_ tab: CoordinatorTab) {
//		self.tab = tab
//	}
}

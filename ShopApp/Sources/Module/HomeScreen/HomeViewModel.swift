//
//  MainViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject, Identifiable {
	
	@Published var text: String = String()
	@Published var categories: [HomeScreenModel] = HomeScreenModel.mockModels
	@Published var bestSeller: [BestSeller] = [] // = BestSeller.mock
	@Published var homeStore: [HomeStore] = [] // = HomeStore.mock
	@Published var modelService: ModelService
	
	private unowned let coordinator: CoordinatorObject
	
	init(coordinator: CoordinatorObject) {
		self.coordinator = coordinator
		self.modelService = ModelService()
		modelService.fetchBestSeller { model in
			self.bestSeller = model.bestSeller
			self.homeStore = model.homeStore
		}
	}
	
	func openDetail() {
		coordinator.open(.detail)
	}
	
	func openFilter() {
		coordinator.openFilter()
	}
	
	func selectCategory(_ model: Binding<HomeScreenModel>) {
		withAnimation {
			for i in categories.indices {
				categories[i].isSelected = false
			}
			model.isSelected.wrappedValue.toggle()
		}
	}
	
	func makeFavourite(_ model: Binding<BestSeller>) {
		model.isFavorites.wrappedValue.toggle()
	}
}

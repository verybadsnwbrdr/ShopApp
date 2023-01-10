//
//  MainViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject, Identifiable {
	
	@Published var searchText: String = String()
	@Published var categories: [HomeScreenModel] = HomeScreenModel.model
//	@Published var bestSeller: [BestSeller] = []
//	@Published var homeStore: [HomeStore] = []
	@Published var modelService: ModelService
	@Published var model: Model
	
	private unowned let coordinator: CoordinatorObject
	
	init(coordinator: CoordinatorObject) {
		self.coordinator = coordinator
		self.modelService = ModelService()
		model = .init(homeStore: [], bestSeller: [])
	}
	
	func fetch() {
		let urlStr = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
		guard let url = URL(string: urlStr) else { return }
		modelService.fetch(from: url)
			.receive(on: RunLoop.main)
			.assign(to: &$model)
	}
	
	func openDetail() {
		coordinator.open(.detail)
	}
	
	func openFilter() {
		coordinator.openFilter()
	}
	
	func selectCategory(_ model: HomeScreenModel) {
		withAnimation {
			for i in categories.indices {
				categories[i].isSelected = categories[i].id == model.id ? true : false
			}
		}
	}
	
	func makeFavourite(_ id: Int) {
		for i in model.bestSeller.indices {
			if model.bestSeller[i].id == id {
				model.bestSeller[i].isFavorites.toggle()
			}
		}
	}
}

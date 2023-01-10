//
//  MainViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject, Identifiable {
	
	@Published var searchText: String = String()
	@Published private(set) var categories: [HomeScreenModel] = HomeScreenModel.model
	@Published private var modelService: ModelService
	@Published private(set) var model: Model!
	
	private unowned let coordinator: CoordinatorObject
	
	init(coordinator: CoordinatorObject, modelService: ModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		self.model = modelService.model
		fetch()
	}
	
	private func fetch() {
		modelService.fetch(from: EndPoint.homeURL.optionalURL)
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

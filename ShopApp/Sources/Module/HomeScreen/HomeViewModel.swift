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
	@Published private var modelService: HomeModelService
	@Published private(set) var model: HomeModel!
	
	private unowned let coordinator: CoordinatorObject
	
	init(coordinator: CoordinatorObject, modelService: HomeModelService) {
		self.coordinator = coordinator
		self.modelService = modelService
		self.model = modelService.model
		bind()
	}
	
	private func bind() {
		modelService.fetch(from: EndPoint.homeURL.optionalURL)
			.receive(on: RunLoop.main)
			.assign(to: &$model)
	}
}

// MARK: - Navigation

extension HomeViewModel {
	
	func openDetail() {
		coordinator.open(.detail)
	}
	
	func openFilter() {
		coordinator.openFilter()
	}
}

// MARK: - ModelUpdate

extension HomeViewModel {
	
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

//
//  MainViewModel.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import Foundation

class MainViewModel: ObservableObject, Identifiable {
	
	@Published var items = Model.mock
	@Published var categories = HomeScreenModel.mockModels
	
	private unowned let coordinator: CoordinatorObject
	
	init(coordinator: CoordinatorObject) {
		self.coordinator = coordinator
	}
	
	func open(_ item: Model) {
		coordinator.open(item)
	}
	
	func selectCategory(_ model: HomeScreenModel) {
		
	}
}

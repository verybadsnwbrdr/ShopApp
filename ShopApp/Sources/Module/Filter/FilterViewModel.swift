//
//  FilterViewModel.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import Foundation

final class FilterViewModel: ObservableObject, Identifiable {
	
	private unowned let coordinator: CoordinatorObject
	
	init(coordinator: CoordinatorObject) {
		self.coordinator = coordinator
	}
	
	func close() {
		self.coordinator.closeFilter()
	}
}

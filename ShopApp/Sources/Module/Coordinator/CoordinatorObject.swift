//
//  CoordinatorObject.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import Foundation

enum CoordinatorTab {
	case home
	case cart
}

class CoordinatorObject: ObservableObject {
	
	@Published var tab = CoordinatorTab.home
	@Published var mainViewModel: HomeViewModel!
	@Published var detailViewModel: HomeViewModel?
	
	init() {
		self.mainViewModel = HomeViewModel(coordinator: self)
	}
	
	func open(_ item: Model) {
		
	}
	
}

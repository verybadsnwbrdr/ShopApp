//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

@main
struct ShopAppApp: App {
	
	@StateObject var coordinator = CoordinatorObject(modelService: ModelService(),
													 cartModelService: CartModelService(),
													 detailModelService: DetailModelService())
//	@StateObject var coordinator = CoordinatorObject(modelService: ModelService(),
//													 cartModelService: CartModelService())
	
	var body: some Scene {
		WindowGroup {
			CoordinatorView(coordinator: coordinator)
		}
	}
}

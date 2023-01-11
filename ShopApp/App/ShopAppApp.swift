//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

@main
struct ShopAppApp: App {
	
	@StateObject var coordinator = CoordinatorObject(modelService: HomeModelService(),
													 cartModelService: CartModelService(),
													 detailModelService: DetailModelService())
	
	var body: some Scene {
		WindowGroup {
			CoordinatorView(coordinator: coordinator)
		}
	}
}

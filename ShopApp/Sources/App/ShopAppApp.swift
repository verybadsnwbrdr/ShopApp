//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

@main
struct ShopAppApp: App {
	@StateObject var coordinator = CoordinatorObject(modelService: ModelService())
	
    var body: some Scene {
        WindowGroup {
//			HomeView(viewModel: HomeViewModel(coordinator: CoordinatorObject()))
			CoordinatorView(coordinator: coordinator)
        }
    }
}

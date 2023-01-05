//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

@main
struct ShopAppApp: App {
    var body: some Scene {
        WindowGroup {
			HomeView(viewModel: HomeViewModel(coordinator: CoordinatorObject()))
        }
    }
}

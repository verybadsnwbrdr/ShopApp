//
//  CoordinatorView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct CoordinatorView: View {
	
	@ObservedObject var coordinator: CoordinatorObject
	
	var body: some View {
		NavigationStack(path: $coordinator.path) {
			TabBarView(coordinator: self.coordinator) {
				HomeView(viewModel: self.coordinator.homeViewModel)
			}
			.navigationDestination(for: CoordinatorTab.self) { tab in
				self.coordinator.destination(tab)
			}
		}
		.sheet(item: $coordinator.filterViewModel) { viewModel in
			FilterView(viewModel: viewModel)
				.presentationDetents([.height(375)])
		}
		.padding(.top)
		.background(Colors.backroundColor.view, ignoresSafeAreaEdges: .all)
	}
}

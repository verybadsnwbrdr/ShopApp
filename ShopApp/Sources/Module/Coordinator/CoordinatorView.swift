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
			ZStack {
				HomeView(viewModel: coordinator.homeViewModel)
					.padding(.bottom, 45)
				TabBarView(coordinator: self.coordinator)
			}
			.navigationDestination(for: CoordinatorTab.self) { tab in
				coordinator.openScreen(tab)
			}
		}
		.sheet(item: $coordinator.filterViewModel) { viewModel in
			FilterView(viewModel: viewModel)
				.presentationDetents([.height(375)])
		}
		.padding(.top)
		.background(Colors.backroundColor.color, ignoresSafeAreaEdges: .all)
	}
}

struct CoordinatorView_Previews: PreviewProvider {
	static var previews: some View {
		CoordinatorView(coordinator: .shared)
	}
}

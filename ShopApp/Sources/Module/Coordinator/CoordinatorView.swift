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
		ZStack {
			NavigationStack(path: $coordinator.path) {
				HomeView(viewModel: coordinator.homeViewModel)
					.padding(.bottom, 45)
					.navigationDestination(for: CoordinatorTab.self) { tab in
						switch tab {
						case .detail:
							DetailView(viewModel: coordinator.detailViewModel!)
						default:
							Images.books.image
						}
			}
		}
			TabBarView()
		}
		.sheet(item: $coordinator.filterViewModel) { viewModel in
			FilterView(viewModel: viewModel)
				.presentationDetents([.height(375)])
		}
	}
}

struct CoordinatorView_Previews: PreviewProvider {
	static var previews: some View {
		CoordinatorView(coordinator: CoordinatorObject(modelService: ModelService()))
	}
}

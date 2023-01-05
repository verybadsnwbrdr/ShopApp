//
//  HomeView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct HomeView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 24) {
				TopHomeSubView()
					.padding([.leading, .trailing], 35)
				SelectCategoryView(categories: $viewModel.categories,
								   action: { viewModel.selectCategory($0) })
				SearchAndQRView(text: $viewModel.text)
					.padding([.leading, .trailing], 35)
				HotSalesView(homeStores: $viewModel.homeStore)
				BestSellerView(bestSellers: $viewModel.bestSeller,
							   action: { viewModel.makeFavourite($0) })
			}
			.padding(.leading, 17)
			.padding(.top)
		}
//		.background(
//			Colors.backroundColor.color
//		)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(viewModel: HomeViewModel(coordinator: CoordinatorObject()))
	}
}


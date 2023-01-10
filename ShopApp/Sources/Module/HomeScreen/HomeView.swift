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
				TopHomeSubView(openFilter: viewModel.openFilter)
					.padding([.leading, .trailing], 35)
				SelectCategoryView(categories: viewModel.categories,
								   action: { viewModel.selectCategory($0) })
				SearchAndQRView(text: $viewModel.searchText)
					.padding([.leading, .trailing], 35)
				HotSalesView(homeStores: viewModel.model.homeStore,
							 openDetail: viewModel.openDetail)
				BestSellerView(bestSellers: viewModel.model.bestSeller,
							   makeFavourite: viewModel.makeFavourite,
							   openDetailView: viewModel.openDetail )
			}
			.padding(.leading, 17)
		}
		.background(Colors.backroundColor.view)
	}
}

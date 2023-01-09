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
				SelectCategoryView(categories: $viewModel.categories,
								   action: { viewModel.selectCategory($0) })
				SearchAndQRView(text: $viewModel.text)
					.padding([.leading, .trailing], 35)
				HotSalesView(homeStores: $viewModel.homeStore,
							 openDetail: viewModel.openDetail)
				BestSellerView(bestSellers: $viewModel.bestSeller,
							   makeFavourite: { viewModel.makeFavourite($0) },
							   openDetailView: viewModel.openDetail )
			}
			.padding(.leading, 17)
		}
		.background(Colors.backroundColor.color)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(viewModel: .init(coordinator: .shared))
	}
}


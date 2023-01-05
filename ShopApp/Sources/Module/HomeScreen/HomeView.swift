//
//  HomeView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct HomeView: View {
	
	@ObservedObject var viewModel: HomeViewModel
	@State var text = String()
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				TopHomeSubView()
					.padding([.leading, .trailing], 35)
				SelectCategoryView(categories: $viewModel.categories,
								   action: { viewModel.selectCategory($0) })
				
				SearchAndQRView(text: $text)
					.padding([.leading, .trailing], 35)
				HotSalesView(homeStores: $viewModel.homeStore)
				BestSellerView(bestSellers: $viewModel.bestSeller,
							   action: { viewModel.makeFavourite($0) })
			}
			.padding(.leading, 17)
			.padding([.top, .bottom])
		}
		.background(
			Colors.backroundColor.color
		)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(viewModel: HomeViewModel(coordinator: CoordinatorObject()))
	}
}


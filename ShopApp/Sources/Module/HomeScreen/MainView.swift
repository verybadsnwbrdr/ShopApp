//
//  MainView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct MainView: View {
	
	@ObservedObject var viewModel: MainViewModel
	@State var text = String()
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				TopHomeSubView()
					.padding([.leading, .trailing], 35)
				SelectCategoryView(categories: $viewModel.categories)
				SearchAndQRView(text: $text)
					.padding([.leading, .trailing], 35)
				HotSalesView(models: $viewModel.homeStore)
				BestSellerView(bestSeller: $viewModel.bestSeller)
			}
			.padding(.leading, 17)
			.padding([.top, .bottom])
		}
		.background(
			Colors.backroundColor.color
		)
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(viewModel: MainViewModel(coordinator: CoordinatorObject()))
	}
}


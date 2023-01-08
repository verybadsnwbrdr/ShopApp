//
//  CartView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct DetailView: View {
	@ObservedObject var viewModel: DetailViewModel

	var body: some View {
		VStack {
			CarouselView(images: $viewModel.model.images)
			Spacer()
			PhoneInfoView(model: $viewModel.model,
						  makeFavourite: { viewModel.makeFavourite($0) },
						  selectColor: { viewModel.selectColor($0) },
						  addToCart: viewModel.addToCart)
		}
		.padding(.top)
		.background(Colors.backroundColor.color, ignoresSafeAreaEdges: .all)
		.ignoresSafeArea(.all, edges: .bottom)
		.navigationBarBackButtonHidden()
		.toolbar { navigationBar }
	}
}

private extension DetailView {
	var navigationBar: some ToolbarContent {
		ToolbarItemGroup(placement: .principal) {
			HStack {
				SquareRoundedButtonView(buttonAction: viewModel.previousScreen,
										image: Images.cancel,
										color: .darkBlue)
				Spacer()
				Localization.productDetails.textView
					.font(Fonts.eighteen.medium)
					.tint(Colors.darkBlue.color)
				Spacer()
				SquareRoundedButtonView(buttonAction: viewModel.openCart,
										image: Images.bag,
										color: .orange)
			}
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView(viewModel: DetailViewModel(coordinator: CoordinatorObject.shared, modelService: .init()))
	}
}

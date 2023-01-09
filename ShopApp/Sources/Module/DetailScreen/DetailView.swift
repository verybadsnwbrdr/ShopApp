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
			content
		}
		.onAppear { viewModel.fetch() }
		.padding(.top)
		.background(Colors.backroundColor.color, ignoresSafeAreaEdges: .all)
		.ignoresSafeArea(.all, edges: .bottom)
		.navigationBarBackButtonHidden()
		.toolbar { navigationBar }
	}
	
	@ViewBuilder
	var content: some View {
		if let model = viewModel.model {
			VStack {
				CarouselView(images: model.images)
				Spacer()
				PhoneInfoView(model: model,
							  makeFavourite: viewModel.makeFavourite,
							  selectColor: viewModel.selectColor,
							  addToCart: viewModel.addToCart)
			}
		} else {
			Colors.backroundColor.color
		}
	}
}

private extension DetailView {
	var navigationBar: some ToolbarContent {
		ToolbarItemGroup(placement: .principal) {
			HStack {
				SquareRoundedButtonView(buttonAction: viewModel.previousScreen,
										image: Images.backShevron,
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

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
						  selectColor: { viewModel.selectColor($0) })
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
				SquareRoundedButtonView(buttonAction: viewModel.close,
										image: Images.cancel,
										color: .darkBlue)
				Spacer()
				Localization.productDetails.text
					.font(Fonts.eighteen.medium)
					.tint(Colors.darkBlue.color)
				Spacer()
				SquareRoundedButtonView(buttonAction: viewModel.close,
										image: Images.bag,
										color: .orange)
			}
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView(viewModel: DetailViewModel(coordinator: CoordinatorObject(modelService: ModelService()), modelService: .init()))
	}
}

//			RoundedRectangle(cornerRadius: 30, style: .continuous)
//				.fill(.white)
//				.shadow(color: Colors.shadow.color, radius: 20)
//				.frame(height: 400)
//				.overlay(alignment: .top) {
//					VStack(alignment: .leading, spacing: 24) {
//						HStack {
//							Text(viewModel.model.title)
//								.font(Fonts.twentyFive.medium)
//								.tint(Colors.darkBlue.color)
//							Spacer()
//							SquareRoundedButtonView(buttonAction: viewModel.close,
//													image: .favourite,
//													color: .darkBlue)
//						}
//						.overlay(alignment: .bottomLeading) {
//							RatingView(rating: viewModel.model.rating)
//								.offset(y: 12)
//						}
//
//						HStack {
//							Localization.shop.text
//								.overlay(alignment: .bottom) {
//									RoundedRectangle(cornerRadius: 1)
//										.fill(Colors.orange.color)
//										.frame(width: 86, height: 2)
//										.offset(y: 8)
//								}
//							Spacer()
//							Localization.details.text
//							Spacer()
//							Localization.features.text
//						}
//						.font(Fonts.twenty.bold)
//						.tint(Colors.darkBlue.color)
//
//						HStack {
//							OptionsView(image: .core, title: viewModel.model.cpu)
//							Spacer()
//							OptionsView(image: .camera, title: viewModel.model.camera)
//							Spacer()
//							OptionsView(image: .ram, title: viewModel.model.sd)
//							Spacer()
//							OptionsView(image: .sd, title: viewModel.model.ssd)
//						}
//						.foregroundColor(Colors.lightGray.color)
//
//						VStack(alignment: .leading) {
//							Localization.selectColorAndCapacity.text
//								.font(Fonts.sixteen.medium)
//								.tint(Colors.darkBlue.color)
//							HStack {
//								HStack(spacing: 18) {
//									ColorSelectButtonView(isSelected: .constant(true),
//														  color: .darkBlue)
//									ColorSelectButtonView(isSelected: .constant(false),
//														  color: .orange)
//								}
//								Spacer()
//								StorageSelectionView(buttonAction: {})
//							}
//						}
//
//						TextButtonView(buttonAction: {},
//									   title: Localization.addToCard.rawValue + "    $" + viewModel.model.price.description)
//						.frame(height: 54)
//					}
//					.padding([.leading, .trailing], 37)
////					.padding(.top, 20)
//					.padding([.top, .bottom])

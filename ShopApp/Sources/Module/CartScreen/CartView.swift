//
//  CartView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct CartView: View {
	
	@ObservedObject var viewModel: CartViewModel

	var body: some View {
		VStack(alignment: .leading) {
			Localization.myCart.textView
				.font(Fonts.thirtyFive.bold)
				.padding([.leading, .trailing], 42)
				.padding(.bottom, 30)
			VStack {
				ScrollView {
					VStack(spacing: 30) {
						ForEach(viewModel.model.basket) { model in
							CellCartView(name: model.title,
										 finalPrice: model.price,
										 picture: model.images,
										 minusAction: { viewModel.delete(model) },
										 plusAction: { viewModel.addToCart(model) },
										 bucketAction: { viewModel.delete(model) })
							.padding(.horizontal, 33)
						}
					}
				}
				Spacer()
				TotalPriceAndDeliveryView(totalPrice: viewModel.model.total,
										  delivery: viewModel.model.delivery)
				TextButtonView(buttonAction: viewModel.buy,
							   title: Localization.checkOut.rawValue)
				.frame(height: 54)
				.padding([.horizontal, .bottom], 44)
			}
			.padding(.top, 60)
			.background(
				Group {
					RoundedRectangle(cornerRadius: 30)
						.fill(Colors.darkBlue.view)
						.shadow(color: Colors.shadow.view, radius: 20)
					Rectangle()
						.offset(y: 300)
						.fill(Colors.darkBlue.view)
				}
			)
		}
		.padding(.top)
		.background(Colors.backroundColor.view, ignoresSafeAreaEdges: .all)
		.ignoresSafeArea(.all, edges: .bottom)
		.navigationBarBackButtonHidden()
		.toolbar { navigationBar }
	}
}

private extension CartView {
	var navigationBar: some ToolbarContent {
		ToolbarItemGroup(placement: .principal) {
			HStack(spacing: 9) {
				SquareRoundedButtonView(buttonAction: viewModel.previousScreen,
										image: Images.backShevron,
										color: .darkBlue)
				Spacer()
				Localization.addAddress.textView
					.font(Fonts.fifteen.medium)
					.tint(Colors.darkBlue.view)
				SquareRoundedButtonView(buttonAction: viewModel.selectAdress,
										image: Images.addAdress,
										color: .orange)
			}
		}
	}
}

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
						ForEach(viewModel.models) { model in
							CellCartView(id: model.id,
										 name: model.name,
										 finalPrice: model.finalPrice,
										 counter: model.number,
										 picture: model.picture,
										 minusAction: { viewModel.decrement(model.id) },
										 plusAction: { viewModel.increment(model.id) },
										 bucketAction: { viewModel.removeFromCart(model.id) })
							.padding([.leading, .trailing], 33)
						}
					}
				}
				Spacer()
				TotalPriceAndDeliveryView(totalPrice: viewModel.totalPrice)
				TextButtonView(buttonAction: { },
							   title: Localization.checkOut.rawValue)
				.frame(height: 54)
				.padding([.horizontal, .bottom], 44)
			}
			.padding(.top, 60)
			.background(
				RoundedRectangle(cornerRadius: 30)
					.fill(Colors.darkBlue.color)
					.shadow(color: Colors.shadow.color, radius: 20)
			)
			
		}
		.padding(.top)
		.background(Colors.backroundColor.color, ignoresSafeAreaEdges: .all)
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
					.tint(Colors.darkBlue.color)
				SquareRoundedButtonView(buttonAction: viewModel.selectAdress,
										image: Images.addAdress,
										color: .orange)
			}
		}
	}
}

struct CartView_Previews: PreviewProvider {
	static var previews: some View {
		CartView(viewModel: CartViewModel(
			coordinator: CoordinatorObject.shared,
			modelService: CartModelService())
		)
	}
}

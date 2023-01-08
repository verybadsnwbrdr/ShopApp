//
//  CartView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct CartView: View {
	@ObservedObject var viewModel: CartViewModel
//	@Binding var model: [CartModel]
	
	var body: some View {
		VStack(alignment: .leading) {
			Localization.myCart.textView
				.font(Fonts.thirtyFive.bold)
				.padding([.leading, .trailing], 42)
				.padding(.bottom, 30)
			VStack {
				ScrollView {
					VStack(spacing: 30) {
						ForEach($viewModel.models) { model in
							HStack(spacing: 17) {
								RoundedRectangle(cornerRadius: 10)
									.fill(.white)
									.frame(width: 88, height: 88)
									.overlay {
										Text(model.id.wrappedValue.description)
//										Text(model.id.description)
											.foregroundColor(Colors.darkBlue.color)
									}
								
								VStack(alignment: .leading, spacing: 7) {
									Text(model.name.wrappedValue)
//									Text(model.name)
										.foregroundColor(Colors.white.color)
										.multilineTextAlignment(.leading)
									Text(model.finalPrice.wrappedValue.moneyDescription())
//									Text(model.finalPrice.moneyDescription())
										.foregroundColor(Colors.orange.color)
								}
								.font(Fonts.twenty.medium)
								
								Spacer()

								NumberIncrementButtonView(
//									counter: $viewModel.count,
									counter: .constant(1),
									minus: { viewModel.removeFromCart(model.id) },
									plus: { viewModel.addToCart(model.wrappedValue) }
//									plus: { viewModel.addToCart(model) }
								)
								
								Button {
									viewModel.removeAll()
								} label: {
									Images.bucket.image
								}
							}
							
							.padding([.leading, .trailing], 33)
						}
					}
				}
				
				
				Spacer()
				
				Divider()
					.background(Color.white)
					.padding(4)
				HStack {
					VStack(alignment: .leading, spacing: 16) {
						Localization.total.textView
						Localization.delivery.textView
					}
					.font(Fonts.fifteen.regular)
					Spacer()
					VStack(alignment: .leading, spacing: 16) {
						Text(viewModel.totalPrice.moneyDescription() + " us")
						Localization.free.textView
					}
					.font(Fonts.fifteen.bold)
				}
				.frame(height: 70)
				.padding([.leading, .trailing], 55)
				.foregroundColor(.white)
				
				Divider()
					.background(Color.white)
					.padding(4)
					.padding(.bottom, 27)
				
				TextButtonView(buttonAction: { },
							   title: Localization.checkOut.rawValue)
				.frame(height: 54)
				.padding(.bottom, 44)
				.padding([.leading, .trailing], 44)
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
										image: Images.cancel,
										color: .darkBlue)
				Spacer()
				Localization.addAddress.textView
					.font(Fonts.fifteen.medium)
					.tint(Colors.darkBlue.color)
				SquareRoundedButtonView(buttonAction: viewModel.selectAdress,
										image: Images.bag,
										color: .orange)
			}
		}
	}
}

struct CartView_Previews: PreviewProvider {
	static var previews: some View {
		CartView(viewModel: CartViewModel(
			coordinator: CoordinatorObject.shared,
			modelService: CartModelService()/*,
			models: [.mockModel,
					 .mockModel]*/)
		)
	}
}

//ForEach($viewModel.models, id: \.id) { model in
//	HStack(spacing: 17) {
//		RoundedRectangle(cornerRadius: 10)
//			.fill(.white)
//			.frame(width: 88, height: 88)
//			.overlay {
//				Text(model.id.wrappedValue.description)
//					.foregroundColor(Colors.darkBlue.color)
//			}
//
//		VStack(alignment: .leading, spacing: 7) {
//			Text(model.name.wrappedValue)
//				.foregroundColor(Colors.white.color)
//				.multilineTextAlignment(.leading)
//			Text(model.finalPrice.wrappedValue.moneyDescription())
//				.foregroundColor(Colors.orange.color)
//		}
//		.font(Fonts.twenty.medium)
//
//		Spacer()
//
//		NumberIncrementButtonView(
//			counter: $viewModel.count,
//			minus: { viewModel.removeFromCart(model.id) },
//			plus: { viewModel.addToCart(model.wrappedValue) }
//		)
//
//		Button {
//			viewModel.removeAll()
//		} label: {
//			Images.bucket.image
//		}
//	}
//	.padding([.leading, .trailing], 33)

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
			.padding([.leading, .trailing], 20)
			
			Image("")
			Spacer()
			RoundedRectangle(cornerRadius: 30)
				.fill(.white)
				.shadow(color: Colors.shadow.color, radius: 20)
				.frame(height: 430)
				.overlay {
					VStack(alignment: .leading, spacing: 30) {
						HStack {
							Text(viewModel.model.title)
								.font(Fonts.twentyFive.medium)
								.tint(Colors.darkBlue.color)
							Spacer()
							SquareRoundedButtonView(buttonAction: viewModel.close,
													image: .favourite,
													color: .darkBlue)
						}
						.overlay(alignment: .bottomLeading){
							RatingView(rating: 4.5)
								.offset(y: 12)
						}
						
						HStack {
							Text("Shop")
								.overlay(alignment: .bottom) {
									RoundedRectangle(cornerRadius: 1)
										.fill(Colors.orange.color)
										.frame(width: 86, height: 2)
										.offset(y: 8)
								}
							Spacer()
							Text("Details")
							Spacer()
							Text("Features")
						}
						.font(Fonts.twenty.bold)
						.tint(Colors.darkBlue.color)
						
						
						HStack {
							OptionsView(image: .core, title: viewModel.model.cpu)
							Spacer()
							OptionsView(image: .camera, title: viewModel.model.camera)
							Spacer()
							OptionsView(image: .ram, title: viewModel.model.sd)
							Spacer()
							OptionsView(image: .sd, title: viewModel.model.ssd)
						}
						.foregroundColor(Colors.lightGray.color)
						
						Text("Select color and capacity")
							.font(Fonts.sixteen.medium)
							.tint(Colors.darkBlue.color)
						HStack {
							HStack(spacing: 18) {
								ColorSelectButtonView(isSelected: .constant(true),
													  color: .darkBlue)
								ColorSelectButtonView(isSelected: .constant(false),
													  color: .orange)
							}
							Spacer()
							StorageSelectionView(buttonAction: {})
						}
						TextButtonView(buttonAction: {},
									   title: "Add to card")
						.frame(height: 54)
					}
					.padding([.leading, .trailing], 37)
				}
		}
		.background(
			Colors.backroundColor.color
		)
		.padding(.bottom, 50)
		.ignoresSafeArea(.all, edges: .bottom)
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView(viewModel: DetailViewModel(coordinator: CoordinatorObject(modelService: ModelService()), modelService: .init()))
	}
}

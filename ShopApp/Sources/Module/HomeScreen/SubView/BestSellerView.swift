//
//  BestSellerView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct BestSellerView: View {
	
	var columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]

	@ObservedObject var viewModel: MainViewModel
	
	var body: some View {
		VStack {
			HeaderView(title: Localization.bestSeller.rawValue,
					   buttonTitle: Localization.seeMore.rawValue)
			LazyVGrid(columns: columns, spacing: 14) {
				ForEach($viewModel.bestSeller, id: \.id) { model in
					RoundedRectangle(cornerRadius: 10)
						.foregroundColor(.white)
						.frame(height: 227)
						.overlay(alignment: .top) {
//							Image(systemName: "heart")
							viewModel.fetchImage(model.wrappedValue)

						}
						.overlay(alignment: .bottomLeading) {
							PriceAndNameView(name: model.title.wrappedValue,
											 discountPrice: model.discountPrice.wrappedValue,
											 priceWithoutDiscount: model.priceWithoutDiscount.wrappedValue)
							.padding(.leading, 21)
							.padding(.bottom, 15)
						}
						.overlay(alignment: .topTrailing) {
							Circle()
								.frame(width: 25)
								.foregroundColor(.white)
								.overlay {
									Button {
										viewModel.makeFavourite(model)
									} label: {
										Image(model.isFavorites.wrappedValue ?
											  Images.favouriteFill.rawValue :
												Images.favourite.rawValue)
										.foregroundColor(Colors.orange.color)
									}
									
								}
								.shadow(color: .black.opacity(0.20),
										radius: 20)
								.padding(.trailing, 12)
								.padding(.top, 10)
						}
				}
			}
			.shadow(color: Colors.shadow.color,
					radius: 40)
			.padding(.trailing, 21)
		}
	}
}

struct BestSellerView_Previews: PreviewProvider {
	static var previews: some View {
		BestSellerView(viewModel: MainViewModel(coordinator: CoordinatorObject()))
	}
}

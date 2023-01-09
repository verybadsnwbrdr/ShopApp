//
//  BestSellerView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct BestSellerView: View {
	@Binding var bestSellers: [BestSeller]
	var makeFavourite: (Binding<BestSeller>) -> ()
	var openDetailView: () -> ()
	
	var columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		VStack {
			HeaderView(title: Localization.bestSeller.rawValue,
					   buttonTitle: Localization.seeMore.rawValue)
			LazyVGrid(columns: columns, spacing: 14) {
				ForEach($bestSellers, id: \.id) { model in
					RoundedRectangle(cornerRadius: 10)
						.fill(.white)
						.frame(height: 227)
						.overlay(alignment: .top) {
							AsyncImageView(stringURL: model.picture.wrappedValue, cornerRadius: 10)
								.frame(height: 168)
						}
						.overlay(alignment: .bottomLeading) {
							PriceAndNameView(name: model.title.wrappedValue,
											 discountPrice: model.discountPrice.wrappedValue,
											 priceWithoutDiscount: model.priceWithoutDiscount.wrappedValue)
							.padding(.leading, 21)
							.padding(.bottom, 15)
						}
						.overlay(alignment: .topTrailing) {
							Button {
								makeFavourite(model)
							} label: {
								FavouriteCircleImageView(isFavorites: model.isFavorites)
									.frame(width: 25)
									.padding(.trailing, 12)
									.padding(.top, 10)
							}
						}
						.onTapGesture {
							openDetailView()
						}
				}
			}
			.padding(.trailing, 21)
		}
	}
}

//struct BestSellerView_Previews: PreviewProvider {
//	static var previews: some View {
//		BestSellerView(viewModel: MainViewModel(coordinator: CoordinatorObject()))
//	}
//}

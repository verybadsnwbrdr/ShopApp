//
//  BestSellerView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct BestSellerView: View {
	var name: String
	var discountPrice: Int
	var priceWithoutDiscount: Int
	
    var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.foregroundColor(.white)
			.frame(height: 227)
			.overlay(alignment: .bottomLeading) {
				PriceAndNameView(name: name,
								 discountPrice: discountPrice,
								 priceWithoutDiscount: priceWithoutDiscount)
				.padding(.leading, 21)
				.padding(.bottom, 15)
			}
			.overlay(alignment: .topTrailing) {
				Circle()
					.frame(width: 25)
					.foregroundColor(.white)
					.overlay {
						Images.favourite.image
							.foregroundColor(Colors.orange.color)
					}
					.shadow(color: .black.opacity(0.20),
							radius: 20)
					.padding(.trailing, 12)
					.padding(.top, 10)
			}
    }
}

//struct BestSellerView_Previews: PreviewProvider {
//    static var previews: some View {
//        BestSellerView()
//    }
//}

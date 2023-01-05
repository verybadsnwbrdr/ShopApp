//
//  PriceAndNameView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct PriceAndNameView: View {
	var name: String
	var discountPrice: Int
	var priceWithoutDiscount: Int
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .center) {
				Text("$\(discountPrice)")
					.font(Fonts.sixteen.bold)
					.foregroundColor(Colors.darkBlue.color)
				Text("$\(priceWithoutDiscount)")
					.font(Fonts.ten.medium)
					.strikethrough()
					.foregroundColor(Colors.lightGray.color)
			}
			Text(name)
				.font(Fonts.ten.regular)
				.foregroundColor(Colors.darkBlue.color)
		}
    }
}

struct PriceAndNameView_Previews: PreviewProvider {
    static var previews: some View {
		PriceAndNameView(name: "Samsung Galaxy s20 Ultra",
						 discountPrice: 1047,
						 priceWithoutDiscount: 1500)
    }
}

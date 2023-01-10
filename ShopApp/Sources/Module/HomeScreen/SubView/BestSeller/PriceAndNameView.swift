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
				Text("$\(priceWithoutDiscount)")
					.font(Fonts.sixteen.bold)
					.foregroundColor(Colors.darkBlue.view)
				Text("$\(discountPrice)")
					.font(Fonts.ten.medium)
					.strikethrough()
					.foregroundColor(Colors.lightGray.view)
			}
			Text(name)
				.font(Fonts.ten.regular)
				.foregroundColor(Colors.darkBlue.view)
		}
    }
}

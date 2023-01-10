//
//  TotalPriceAndDeliveryView.swift
//  ShopApp
//
//  Created by Anton on 09.01.2023.
//

import SwiftUI

struct TotalPriceAndDeliveryView: View {
	var totalPrice: Int
	var delivery: String
	
    var body: some View {
		VStack {
			Divider()
				.background(Color.white)
				.padding(4)
			HStack {
				VStack(alignment: .leading, spacing: 16) {
					Localization.total.textView
					Text(delivery)
				}
				.font(Fonts.fifteen.regular)
				Spacer()
				VStack(alignment: .leading, spacing: 16) {
					Text(totalPrice.moneyDescription() + " us")
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
		}
    }
}

//struct TotalPriceAndDeliveryView_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalPriceAndDeliveryView(totalPrice: 1500)
//    }
//}

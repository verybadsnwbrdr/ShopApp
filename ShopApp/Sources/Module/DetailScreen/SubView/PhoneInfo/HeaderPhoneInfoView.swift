//
//  HeaderPhoneInfoView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct HeaderPhoneInfoView: View {
	
	var title: String
	var makeFavourite: () -> ()
	var rating: Double
	
    var body: some View {
		HStack {
			Text(title)
				.font(Fonts.twentyFive.medium)
				.tint(Colors.darkBlue.color)
			Spacer()
				Button {
					makeFavourite()
				} label: {
					RoundedRectangle(cornerRadius: 10)
						.fill(Colors.darkBlue.color)
						.frame(width: 37, height: 37)
						.overlay {
							Images.favourite.image
								.foregroundColor(.white)
						}
				}
		}
		.overlay(alignment: .bottomLeading) {
			RatingView(rating: rating)
				.offset(y: 12)
		}
    }
}

//struct HeaderPhoneInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//		HeaderPhoneInfoView(title: "Samsung",
//							makeFavourite: {},
//							rating: 4.6)
//    }
//}

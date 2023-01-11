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
				.tint(Colors.darkBlue.view)
			Spacer()
				Button {
					makeFavourite()
				} label: {
					RoundedRectangle(cornerRadius: 10)
						.fill(Colors.darkBlue.view)
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

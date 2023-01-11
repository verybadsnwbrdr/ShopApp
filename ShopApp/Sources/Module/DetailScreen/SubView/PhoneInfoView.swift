//
//  PhoneInfoView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct PhoneInfoView: View {
	
	var model: DetailModel
	var makeFavourite: () -> ()
	var selectColor: (String) -> ()
	var addToCart: () -> ()
	
	var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			HeaderPhoneInfoView(title: model.title,
								makeFavourite: makeFavourite,
								rating: model.rating)
			Spacer()
			HStack {
				Localization.shop.textView
					.overlay(alignment: .bottom) {
						RoundedRectangle(cornerRadius: 1)
							.fill(Colors.orange.view)
							.frame(width: 86, height: 2)
							.offset(y: 8)
					}
				Spacer()
				Localization.details.textView
				Spacer()
				Localization.features.textView
			}
			.font(Fonts.twenty.bold)
			.tint(Colors.darkBlue.view)
			Spacer()
			HStack {
				OptionsView(image: .core, title: model.cpu)
				Spacer()
				OptionsView(image: .camera, title: model.camera)
				Spacer()
				OptionsView(image: .ram, title: model.sd)
				Spacer()
				OptionsView(image: .sd, title: model.ssd)
			}
			.foregroundColor(Colors.lightGray.view)
			Spacer()
			VStack(alignment: .leading) {
				Localization.selectColorAndCapacity.textView
					.font(Fonts.sixteen.medium)
					.tint(Colors.darkBlue.view)
				HStack {
					ColorSelectView(isSelected: true,
									colors: model.color,
									selectColor: selectColor)
					Spacer()
					StorageSelectionView(capacities: model.capacity,
										 buttonAction: makeFavourite)
				}
			}
			Spacer()
			TextButtonView(buttonAction: addToCart,
						   title: Localization.addToCard.rawValue + "       " + model.price.moneyDescription())
			.frame(height: 54)
		}
		.padding([.leading, .trailing], 37)
		.padding(.top)
		.padding(.bottom, 44)
		.background(
			RoundedRectangle(cornerRadius: 30, style: .continuous)
				.fill(.white)
				.shadow(color: Colors.shadow.view, radius: 20)
		)
	}
}

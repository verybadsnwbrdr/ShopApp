//
//  PhoneInfoView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct PhoneInfoView: View {
	var model: DetailModel //@Binding
	var makeFavourite: () -> ()
	var selectColor: (String) -> ()
	var addToCart: (DetailModel) -> ()
	
	var body: some View {
		VStack(alignment: .leading) {
			HeaderPhoneInfoView(title: model.title,
								makeFavourite: makeFavourite,
								rating: model.rating)
			Spacer()
			HStack {
				Localization.shop.textView
					.overlay(alignment: .bottom) {
						RoundedRectangle(cornerRadius: 1)
							.fill(Colors.orange.color)
							.frame(width: 86, height: 2)
							.offset(y: 8)
					}
				Spacer()
				Localization.details.textView
				Spacer()
				Localization.features.textView
			}
			.font(Fonts.twenty.bold)
			.tint(Colors.darkBlue.color)
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
			.foregroundColor(Colors.lightGray.color)
			Spacer()
			VStack(alignment: .leading) {
				Localization.selectColorAndCapacity.textView
					.font(Fonts.sixteen.medium)
					.tint(Colors.darkBlue.color)
				HStack {
					ColorSelectView(isSelected: true,
									colors: model.color,
									selectColor: selectColor)
					Spacer()
					StorageSelectionView(capacities: model.capacity,
										 buttonAction: {})
				}
			}
			Spacer()
			TextButtonView(buttonAction: { addToCart(model) },
						   title:
							Localization.addToCard.rawValue + "       " + model.price.moneyDescription())
			.frame(height: 54)
		}
		.padding([.leading, .trailing], 37)
		.padding(.top)
		.padding(.bottom, 44)
		.background(
			RoundedRectangle(cornerRadius: 30, style: .continuous)
				.fill(.white)
				.shadow(color: Colors.shadow.color, radius: 20)
		)
	}
}

//struct PhoneInfoView_Previews: PreviewProvider {
//	static var previews: some View {
//		PhoneInfoView(model: DetailViewModel(coordinator: CoordinatorObject.shared, modelService: DetailModelService()).model,
//					  makeFavourite: {  },
//					  selectColor: { _ in },
//					  addToCart: { })
//	}
//}

//DetailViewModel(coordinator: CoordinatorObject.shared, modelService: DetailModelService().model

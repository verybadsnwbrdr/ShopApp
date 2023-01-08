//
//  PhoneInfoView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct PhoneInfoView: View {
	@Binding var model: DetailModel
	var makeFavourite: (Binding<DetailModel>) -> ()
	var selectColor: (String) -> ()
	
    var body: some View {
		VStack(alignment: .leading) {
			HeaderPhoneInfoView(title: model.title,
								makeFavourite: { makeFavourite($model) },
								rating: model.rating)
			Spacer()
			HStack {
				Localization.shop.text
					.overlay(alignment: .bottom) {
						RoundedRectangle(cornerRadius: 1)
							.fill(Colors.orange.color)
							.frame(width: 86, height: 2)
							.offset(y: 8)
					}
				Spacer()
				Localization.details.text
				Spacer()
				Localization.features.text
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
				Localization.selectColorAndCapacity.text
					.font(Fonts.sixteen.medium)
					.tint(Colors.darkBlue.color)
				HStack {
					ColorSelectView(isSelected: .constant(false),
									colors: model.color,
									selectColor: selectColor)
					Spacer()
					StorageSelectionView(capacities: model.capacity,
										 buttonAction: {})
				}
			}
			Spacer()
			TextButtonView(buttonAction: {},
						   title: Localization.addToCard.rawValue + "    $" + model.price.description)
			.frame(height: 54)
		}
		.padding([.leading, .trailing], 37)
		.padding([.top, .bottom])
		.background(
			RoundedRectangle(cornerRadius: 30, style: .continuous)
				.fill(.white)
				.shadow(color: Colors.shadow.color, radius: 20)
		)
    }
}

struct PhoneInfoView_Previews: PreviewProvider {
    static var previews: some View {
		PhoneInfoView(model: .constant(DetailViewModel.init(coordinator: CoordinatorObject(modelService: ModelService()), modelService: DetailModelService()).model),
					  makeFavourite: { $0 },
					  selectColor: { $0 })
    }
}

//
//  HotSalesView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct HotSalesView: View {
	@ObservedObject var viewModel: MainViewModel
	
	var body: some View {
		VStack {
			HeaderView(title: Localization.hotSales.rawValue,
					   buttonTitle: Localization.seeMore.rawValue)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach($viewModel.homeStore, id: \.id) { model in
						RoundedRectangle(cornerRadius: 10)
							.frame(width: 360, height: 180)
							.overlay(alignment: .bottomLeading) {
								VStack(alignment: .leading, spacing: 20) {
									if model.isNew.wrappedValue != nil {
										Circle()
											.frame(width: 27)
											.foregroundColor(Colors.orange.color)
											.overlay {
												Localization.new.text
													.foregroundColor(.white)
													.font(Fonts.ten.systemBold)
											}
									}
									
									VStack(alignment: .leading, spacing: 5) {
										Text(model.title.wrappedValue)
											.foregroundColor(.white)
											.font(Fonts.twentyFive.systemBold)
										Text(model.subtitle.wrappedValue)
											.foregroundColor(.white)
											.font(Fonts.eleven.systemRegular)
									}
									
									Button(action: { }) {
										RoundedRectangle(cornerRadius: 5)
											.foregroundColor(.white)
											.frame(width: 98, height: 23)
											.overlay {
												Localization.buyNow.text
													.font(Fonts.eleven.systemBold)
													.foregroundColor(Colors.darkBlue.color)
											}
									}
								}
								.padding(.leading, 25)
								.padding(.bottom, 26)
							}
					}
				}
				.padding(.trailing, 21)
			}
		}
	}
}

struct HotSalesView_Previews: PreviewProvider {
	static var previews: some View {
		HotSalesView(viewModel: MainViewModel(coordinator: CoordinatorObject()))
	}
}

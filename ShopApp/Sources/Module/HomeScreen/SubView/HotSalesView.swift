//
//  HotSalesView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct HotSalesView: View {
	var isNew: Bool
	var title: String
	var subtitle: String
	
	
	var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.frame(width: 360, height: 180)
			.overlay(alignment: .bottomLeading) {
				VStack(alignment: .leading, spacing: 20) {
					if isNew {
						Circle()
							.frame(width: 27)
							.foregroundColor(Colors.orange.color)
							.overlay {
								Localization.new.text
									.foregroundColor(.white)
									.font(Fonts.ten.systemBold)
							}
					}
					
					VStack(spacing: 5) {
						Text(title)
							.foregroundColor(.white)
							.font(Fonts.twentyFive.systemBold)
						Text(subtitle)
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

struct HotSalesView_Previews: PreviewProvider {
	static var previews: some View {
		HotSalesView(isNew: true,
					 title: Localization.iphone.rawValue,
					 subtitle: Localization.superMega.rawValue)
	}
}

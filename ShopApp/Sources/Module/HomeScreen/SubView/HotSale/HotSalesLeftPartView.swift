//
//  HotSalesLeftPartView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct HotSalesLeftPartView: View {
	@Binding var isNew: Bool?
	@Binding var title: String
	@Binding var subtitle: String
	
	var body: some View {
		VStack(alignment: .leading, spacing: 20) {
			if let isNew = isNew, isNew {
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
				Text(title)
					.foregroundColor(.white)
					.font(Fonts.twentyFive.systemBold)
				Text(subtitle)
					.foregroundColor(.white)
					.font(Fonts.eleven.systemRegular)
			}
			Button {
				
			} label: {
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
	}
}

//struct HotSalesLeftPartView_Previews: PreviewProvider {
//    static var previews: some View {
//        HotSalesLeftPartView()
//    }
//}

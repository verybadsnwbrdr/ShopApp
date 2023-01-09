//
//  HotSalesLeftPartView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct HotSalesLeftPartView: View {
	var isNew: Bool?
	var title: String
	var subtitle: String
	
	var openDetail: () -> ()
	
	var body: some View {
		VStack(alignment: .leading, spacing: 20) {
			if let isNew = isNew, isNew {
				Circle()
					.frame(width: 27)
					.foregroundColor(Colors.orange.color)
					.overlay {
						Localization.new.textView
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
				openDetail()
			} label: {
				RoundedRectangle(cornerRadius: 5)
					.foregroundColor(.white)
					.frame(width: 98, height: 23)
					.overlay {
						Localization.buyNow.textView
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

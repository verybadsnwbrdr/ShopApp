//
//  Header.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct HeaderView: View {
	var title: String
	var buttonTitle: String
	
    var body: some View {
		HStack {
			Text(title)
				.font(Fonts.twentyFive.bold)
				.foregroundColor(Colors.darkBlue.color)
			Spacer()
			Button(action: {}) {
				Text(buttonTitle)
					.font(Fonts.fifteen.regular)
					.foregroundColor(Colors.orange.color)
			}
		}
		.padding(.trailing, 33)
    }
}

//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//		HeaderView(title: "Select", buttonTitle: "view all")
//    }
//}

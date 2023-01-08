//
//  CartView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct CartView: View {
    var body: some View {
		VStack {
			Localization.myCart.text
				.font(Fonts.thirtyFive.bold)
			Spacer()
			VStack {
				HStack {
					Spacer()
					RoundedRectangle(cornerRadius: 10)
						.fill(.white)
						.frame(width: 88, height: 88)
					Spacer()
					VStack(alignment: .leading) {
						Text("Galaxy Note 20 Ultra")
							.foregroundColor(Colors.white.color)
							.multilineTextAlignment(.leading)
						Text("$3000.00")
							.foregroundColor(Colors.orange.color)
					}
					.font(Fonts.twenty.medium)
					Spacer()
					NumberIncrementButtonView(counter: .constant(2),
											  minus: {},
											  plus: {})
					Spacer()
					Button {
						
					} label: {
						Images.bucket.image
					}
					Spacer()
				}
			}
			.background(
				RoundedRectangle(cornerRadius: 30)
					.fill(Colors.darkBlue.color)
					.frame(height: 690)
			)
		}
//		.background(ignoresSafeAreaEdges: .all)
//		.ignoresSafeArea(.all, edges: .bottom)
		.background(
			RoundedRectangle(cornerRadius: 30, style: .continuous)
				.fill(.white)
				.shadow(color: Colors.shadow.color, radius: 20)
		)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

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
			
			VStack {
				HStack(spacing: 17) {
					RoundedRectangle(cornerRadius: 10)
						.fill(.white)
						.frame(width: 88, height: 88)
					
					VStack(alignment: .leading, spacing: 7) {
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
					
					Button {
						
					} label: {
						Images.bucket.image
					}
				}
				.padding([.leading, .trailing], 33)
				Spacer()
				Divider()
					.background(Color.white)
					.padding(4)
				
				VStack(alignment: .leading) {

						
					HStack {
						Text("Total")

							.tint(.white)
					}
					Spacer()
					HStack {
						Text("Delivery")
						
					}
					Divider()
						
				}
				.frame(height: 90)
				.padding([.leading, .trailing], 33)
				.font(Fonts.fifteen.bold)
				.foregroundColor(.white)
				
				Divider()
					.background(Color.white)
					.padding(4)
				
				TextButtonView(buttonAction: {},
							   title: "Checkout")
				.frame(height: 54)
				.padding(.bottom, 44)
			}
			
			.padding(.top, 80)
			.background(
				RoundedRectangle(cornerRadius: 30)
					.fill(Colors.darkBlue.color)
			)
			
		}
		.ignoresSafeArea(.all, edges: .bottom)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

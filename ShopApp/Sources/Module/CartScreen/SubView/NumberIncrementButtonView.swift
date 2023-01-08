//
//  NumberIncrementButtonView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct NumberIncrementButtonView: View {
	@Binding var counter: Int
	var minus: () -> ()
	var plus: () -> ()
	
    var body: some View {
		RoundedRectangle(cornerRadius: 26)
			.fill(Colors.darkGray.color)
			.frame(width: 26, height: 68)
			.overlay {
				VStack(spacing: 6) {
					Button {
						minus()
					} label: {
						Images.minus.sytemImage
							.resizable()
							.scaledToFit()
							.frame(width: 9)
					}
					Text(counter.description)
						.font(Fonts.twenty.medium)
					Button {
						plus()
					} label: {
						Images.plus.sytemImage
							.resizable()
							.scaledToFit()
							.frame(width: 9)
					}
				}
				.foregroundColor(Colors.white.color)
			}
    }
}

struct NumberIncrementButtonView_Previews: PreviewProvider {
    static var previews: some View {
		NumberIncrementButtonView(counter: .constant(2),
								  minus: {},
								  plus: {})
    }
}

//
//  Image+Extension .swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

extension Image {
	func badge(_ count: Int) -> some View {
		self.overlay(alignment: .topTrailing) {
			RoundedRectangle(cornerRadius: 4)
				.fill(Colors.orange.color)
				.frame(width: 15, height: 15)
				.overlay {
					Text(count.description)
						.font(Fonts.twelve.medium)
				}
				.offset(x: 6, y: -6)
		}
	}
}


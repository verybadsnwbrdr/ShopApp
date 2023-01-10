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
			if count > 0 {
				Text(count.description)
					.font(Fonts.twelve.medium)
					.frame(width: 15, height: 15)
					.background(Colors.orange.view)
					.cornerRadius(4)
					.offset(x: 6, y: -6)
			}
		}
	}
}

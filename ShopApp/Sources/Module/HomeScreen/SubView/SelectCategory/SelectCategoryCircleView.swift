//
//  SelectCategoryCircleView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct SelectCategoryCircleView: View {
	
	var isSelected: Bool
	var image: Images
	var category: String
	
    var body: some View {
		VStack {
			Circle()
				.foregroundColor(
					isSelected ? Colors.orange.view : Colors.white.view
				)
				.overlay {
					image.image
						.foregroundColor(
							isSelected ? Colors.white.view : Colors.darkGray.view
						)
				}
			Text(category)
				.foregroundColor(Colors.darkBlue.view)
				.font(Fonts.twelve.medium)
		}
    }
}

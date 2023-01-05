//
//  SelectCategoryCircleView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct SelectCategoryCircleView: View {
	@Binding var isSelected: Bool
	var image: Images
	var category: String
	
    var body: some View {
		VStack {
			Circle()
				.foregroundColor(
					isSelected ? Colors.orange.color : .white
				)
				.overlay {
					image.image
						.foregroundColor(
							isSelected ? .white : Colors.darkGray.color
						)
				}
			Text(category)
				.foregroundColor(Colors.darkBlue.color)
				.font(Fonts.twelve.medium)
		}
    }
}

struct SelectCategoryCircleView_Previews: PreviewProvider {
    static var previews: some View {
		SelectCategoryCircleView(isSelected: .constant(true),
				   image: .books,
				   category: "Books")
    }
}

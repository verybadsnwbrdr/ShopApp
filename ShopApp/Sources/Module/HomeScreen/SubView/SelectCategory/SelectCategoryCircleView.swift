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
					isSelected ? Colors.orange.color : Colors.white.color
				)
				.overlay {
					image.image
						.foregroundColor(
							isSelected ? Colors.white.color : Colors.darkGray.color
						)
				}
			Text(category)
				.foregroundColor(Colors.darkBlue.color)
				.font(Fonts.twelve.medium)
		}
    }
}

//struct SelectCategoryCircleView_Previews: PreviewProvider {
//    static var previews: some View {
//		SelectCategoryCircleView(isSelected: true,
//				   image: .books,
//				   category: "Books")
//    }
//}

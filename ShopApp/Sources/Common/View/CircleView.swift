//
//  CircleView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct CircleView: View {
	@Binding var isSelected: Bool
	var radius: CGFloat
	var image: Images
	var category: String
	
    var body: some View {
		VStack {
			Circle()
				.frame(width: radius)
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

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
		CircleView(isSelected: .constant(true),
				   radius: 71,
				   image: .books,
				   category: "Books")
    }
}

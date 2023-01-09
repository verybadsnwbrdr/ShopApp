//
//  FavouriteButtonView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct FavouriteCircleImageView: View {
	@Binding var isFavorites: Bool
	
    var body: some View {
		Circle()
			.foregroundColor(.white)
			.overlay {
				Image(isFavorites ?
					  Images.favourite.rawValue :
						Images.favouriteFill.rawValue)
				.foregroundColor(Colors.orange.color)
			}
			.shadow(color: .black.opacity(0.20),
					radius: 20)
    }
}


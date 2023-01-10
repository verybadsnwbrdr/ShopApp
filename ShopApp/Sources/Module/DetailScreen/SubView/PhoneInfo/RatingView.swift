//
//  RatingView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct RatingView: View {
	
	var rating: Double
	private let maxRating = 5
	
    var body: some View {
		HStack {
			ForEach(0 ..< maxRating, id: \.self) { index in
				starView(index)
			}
		}
    }
	
	func starView(_ index: Int) -> some View {
		Images.star.image
			.foregroundColor(
				Int(rating.rounded()) >= index ? .yellow : .gray
			)
	}
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
		RatingView(rating: 0.5)
    }
}

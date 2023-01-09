//
//  RatingView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct RatingView: View {
	
	let rating: Double
	private let maxRating = 5
	private var roundedRating: Int {
		Int(rating.rounded())
	}
	private var ratingArr: [Bool] {
		.init(repeating: true, count: roundedRating) + .init(repeating: false, count: 5 - roundedRating)
	}
	
    var body: some View {
		HStack {
			ForEach(ratingArr, id: \.self) { bool in
				Images.star.image
					.foregroundColor(bool ? .orange : .gray)
			}
		}
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
		RatingView(rating: 0.5)
    }
}

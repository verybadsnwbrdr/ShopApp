//
//  SquareRoundedButtonView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct SquareRoundedButtonView: View {
	
	var buttonAction: () -> ()
	var image: Images
	var color: Colors
	
    var body: some View {
		Button {
			buttonAction()
		} label: {
			RoundedRectangle(cornerRadius: 10)
				.fill(color.view)
				.frame(width: 37, height: 37)
				.overlay {
					image.image
						.foregroundColor(.white)
				}
		}
    }
}

//
//  NumberIncrementButtonView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct NumberIncrementButtonView: View {
	
	var counter: Int
	var minus: () -> ()
	var plus: () -> ()
	
    var body: some View {
		RoundedRectangle(cornerRadius: 26)
			.fill(Colors.incrementButtonColor.view)
			.frame(width: 26, height: 68)
			.overlay {
				VStack(spacing: 6) {
					button(systemImage: .minus, action: minus)
					Text(counter.description)
						.font(Fonts.twenty.medium)
					button(systemImage: .plus, action: plus)
				}
				.foregroundColor(Colors.white.view)
			}
    }
	
	private func button(systemImage: Images,
						action: @escaping () -> ()) -> some View {
		Button {
			withAnimation(.easeInOut, action)
		} label: {
			systemImage.sytemImage
				.resizable()
				.scaledToFit()
				.frame(width: 9, height: 9)
		}
	}
}

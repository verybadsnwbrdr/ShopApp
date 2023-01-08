//
//  NumberIncrementButtonView.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

struct NumberIncrementButtonView: View {
	@Binding var counter: Int
	var minus: () -> ()
	var plus: () -> ()
	
    var body: some View {
		RoundedRectangle(cornerRadius: 26)
			.fill(Colors.incrementButtonColor.color)
			.frame(width: 26, height: 68)
			.overlay {
				VStack(spacing: 6) {
					button(systemImage: .minus, action: minus)
					Text(counter.description)
						.font(Fonts.twenty.medium)
					button(systemImage: .plus, action: plus)
				}
				.foregroundColor(Colors.white.color)
			}
    }
	
	private func button(systemImage: Images,
						action: @escaping () -> ()) -> some View {
		Button {
			action()
		} label: {
			systemImage.sytemImage
				.resizable()
				.scaledToFit()
				.frame(width: 9, height: 9)
		}
	}
}

struct NumberIncrementButtonView_Previews: PreviewProvider {
    static var previews: some View {
		NumberIncrementButtonView(counter: .constant(2),
								  minus: {},
								  plus: {})
    }
}

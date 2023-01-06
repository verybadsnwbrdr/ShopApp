//
//  ColorSelectButtonView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct ColorSelectButtonView: View {
	@Binding var isSelected: Bool
	var color: Colors
	
    var body: some View {
		Button {
			
		} label: {
			Circle()
				.frame(width: 39)
				.overlay {
					if isSelected {
						Images.check.image
					}
				}
				.foregroundColor(color.color)
		}
    }
}

struct ColorSelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
		ColorSelectButtonView(isSelected: .constant(true), color: .darkBlue)
    }
}

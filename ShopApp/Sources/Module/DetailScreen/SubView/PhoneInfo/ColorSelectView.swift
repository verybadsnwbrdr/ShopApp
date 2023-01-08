//
//  ColorSelectButtonView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct ColorSelectView: View {
	@Binding var isSelected: Bool
	var colors: [String]
	var selectColor: (String) -> ()
	
    var body: some View {
		HStack(spacing: 18) {
			button($isSelected, colors.first ?? "", selectColor)
			button(.constant(false), colors.last ?? "", selectColor)
		}
    }
	
	private func button(_ isSelected: Binding<Bool>,
						_ hexString: String,
						_ action: @escaping (String) -> ()) -> some View {
		Button {
			action(hexString)
		} label: {
			Circle()
				.fill(Color(hex: hexString) ?? .black)
				.frame(width: 39)
				.overlay {
					if isSelected.wrappedValue {
						Images.check.image
					}
				}
		}
	}
}

struct ColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
		ColorSelectView(isSelected: .constant(true),
						colors: ["#772D03", "#010035"],
						selectColor: { $0 })
    }
}

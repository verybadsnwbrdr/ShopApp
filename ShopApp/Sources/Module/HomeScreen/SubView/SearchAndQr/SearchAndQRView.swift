//
//  SearchAndQRView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct SearchAndQRView: View {
	
	@Binding var text: String
	
    var body: some View {
		HStack {
			RoundedRectangle(cornerRadius: 50)
				.frame(height: 34)
				.foregroundColor(.white)
				.overlay {
					HStack {
						Images.search.image
						TextField(text: $text) {
							Localization.search.textView
								.font(Fonts.twelve.regular)
						}
						.shadow(color: Colors.shadow.view,
								radius: 20)
					}
					.offset(x: 24)
				}
			
			Button(action: { }) {
				Circle()
					.frame(width: 34)
					.foregroundColor(Colors.orange.view)
					.shadow(color: Colors.shadow.view,
							radius: 20)
					.overlay {
						Images.qrCode.image
					}
			}
		}
    }
}

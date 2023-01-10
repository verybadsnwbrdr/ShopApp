//
//  SectionsFilterView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct SectionsFilterView: View {
	
	var sectionName: String
	var filter: String
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(sectionName)
				.font(Fonts.eighteen.medium)
			
			Button {
			
			} label: {
				RoundedRectangle(cornerRadius: 5)
					.fill(.white)
					.border(Colors.lightGray.view, width: 1)
					.frame(height: 37)
					.overlay {
						HStack {
							Text(filter)
								.font(Fonts.eighteen.regular)
							Spacer()
							Images.chevronDown.sytemImage
								.foregroundColor(Colors.darkGray.view)
						}
						.padding([.leading, .trailing], 14)
					}
			}
		}
		.tint(Colors.darkBlue.view)
    }
}

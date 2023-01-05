//
//  FilterView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
		VStack(spacing: 20) {
			HStack {
				Button {
					
				} label: {
					RoundedRectangle(cornerRadius: 10)
						.fill(Colors.darkBlue.color)
						.frame(width: 37, height: 37)
						.overlay {
							Images.cancel.image
						}
				}
				Spacer()
				Localization.filterOptions.text
					.tint(Colors.darkBlue.color)
				Spacer()
				Button {
					
				} label: {
					RoundedRectangle(cornerRadius: 10)
						.fill(Colors.orange.color)
						.frame(width: 86, height: 37)
						.overlay {
							Localization.done.text
								.tint(.white)
						}
				}
			}
			.font(Fonts.eighteen.medium)
			SectionsFilterView(sectionName: "Brand", filter: "Samsung")
			SectionsFilterView(sectionName: "Price", filter: "$300 - $500")
			SectionsFilterView(sectionName: "Size", filter: "4.5 to 5.5 inches")
		}
		.padding([.leading, .trailing], 35)
		.padding(.top, 24)
		.padding(.bottom, 44)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

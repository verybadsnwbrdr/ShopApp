//
//  TopHomeSubView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct TopHomeSubView: View {
    var body: some View {
		HStack {
			Spacer()
			Button(action: {}) {
				Images.location.image
				Localization.location.text
					.font(Fonts.fifteen.medium)
					.foregroundColor(Colors.darkBlue.color)
				Images.chevronDown.sytemImage
					.foregroundColor(Colors.darkGray.color)
			}
			Spacer()
			Button(action: {}) {
				Images.filter.image
			}
		}
    }
}

struct TopHomeSubView_Previews: PreviewProvider {
    static var previews: some View {
        TopHomeSubView()
    }
}

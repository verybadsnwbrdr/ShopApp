//
//  TopHomeSubView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct TopHomeSubView: View {
	var openFilter: () -> ()
	
    var body: some View {
		HStack {
			Spacer()
			Button {
				
			} label: {
				Images.location.image
				Localization.location.textView
					.font(Fonts.fifteen.medium)
					.foregroundColor(Colors.darkBlue.color)
				Images.chevronDown.sytemImage
					.foregroundColor(Colors.darkGray.color)
			}
			Spacer()
			Button {
				openFilter()
			} label: {
				Images.filter.image
			}
		}
    }
}

struct TopHomeSubView_Previews: PreviewProvider {
    static var previews: some View {
		TopHomeSubView(openFilter: { })
    }
}

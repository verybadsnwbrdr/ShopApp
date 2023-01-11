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
					.foregroundColor(Colors.darkBlue.view)
				Images.chevronDown.sytemImage
					.foregroundColor(Colors.darkGray.view)
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

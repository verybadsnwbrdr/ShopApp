//
//  OptionsView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct OptionsView: View {
	var image: Images
	var title: String
	
    var body: some View {
		VStack {
			image.image
			Text(title)
				.font(Fonts.eleven.regular)
		}
    }
}

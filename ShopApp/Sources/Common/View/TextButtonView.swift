//
//  TextButtonView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct TextButtonView: View {
	
	var buttonAction: () -> ()
	var title: String
	
    var body: some View {
		Button {
			buttonAction()
		} label: {
			RoundedRectangle(cornerRadius: 10)
				.fill(Colors.orange.view)
				.overlay {
					Text(title)
						.tint(.white)
				}
		}
    }
}

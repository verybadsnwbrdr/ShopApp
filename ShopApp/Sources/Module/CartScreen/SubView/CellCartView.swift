//
//  CellCartView.swift
//  ShopApp
//
//  Created by Anton on 09.01.2023.
//

import SwiftUI

struct CellCartView: View {
	
	let counter = 1
	
	var name: String
	var finalPrice: Int
	var picture: String
	var minusAction: () -> ()
	var plusAction: () -> ()
	var bucketAction: () -> ()
	
    var body: some View {
		HStack(spacing: 17) {
			RoundedRectangle(cornerRadius: 10)
				.fill(.white)
				.frame(width: 88, height: 88)
				.overlay {
					AsyncImageView(stringURL: picture, cornerRadius: 10)
						.padding(8)
				}
			
			VStack(alignment: .leading, spacing: 7) {
				Text(name)
					.foregroundColor(Colors.white.view)
					.multilineTextAlignment(.leading)
				
				Text(finalPrice.moneyDescription())
					.foregroundColor(Colors.orange.view)
			}
			.font(Fonts.twenty.medium)
			
			Spacer()
			
			NumberIncrementButtonView(
				counter: counter,
				minus: minusAction,
				plus: plusAction
			)
			
			Button {
				withAnimation(.easeInOut, bucketAction)
			} label: {
				Images.bucket.image
			}
		}
    }
}

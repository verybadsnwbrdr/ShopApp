//
//  CellCartView.swift
//  ShopApp
//
//  Created by Anton on 09.01.2023.
//

import SwiftUI

struct CellCartView: View {
	var id: UUID
	//
	var name: String
	var finalPrice: Int
	var counter: Int
	var minusAction: () -> ()
	var plusAction: () -> ()
	var bucketAction: () -> ()
	
    var body: some View {
		HStack(spacing: 17) {
			RoundedRectangle(cornerRadius: 10)
				.fill(.white)
				.frame(width: 88, height: 88)
				.overlay {
					Text(id.description)
						.foregroundColor(Colors.darkBlue.color)
				}
			
			VStack(alignment: .leading, spacing: 7) {
				Text(name)
					.foregroundColor(Colors.white.color)
					.multilineTextAlignment(.leading)
				
				Text(finalPrice.moneyDescription())
					.foregroundColor(Colors.orange.color)
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

//struct CellCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellCartView()
//    }
//}

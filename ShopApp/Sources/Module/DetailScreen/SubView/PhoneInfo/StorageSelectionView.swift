//
//  StorageSelectionView.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import SwiftUI

struct StorageSelectionView: View {
	var capacities: [String]
	var buttonAction: () -> ()
	@State var isSelected = false
	
	var body: some View {
		HStack {
			Button {
				buttonAction()
			} label: {
				RoundedRectangle(cornerRadius: 10)
					.fill(Colors.orange.color)
					.frame(width: 71, height: 30)
					.overlay {
						Text((capacities.first ?? "") + " Gb")
							.tint(.white)
					}
			}
			Button {
				buttonAction()
			} label: {
				RoundedRectangle(cornerRadius: 10)
					.fill(.white)
					.frame(width: 71, height: 30)
					.overlay {
						Text((capacities.last ?? "") + " Gb")
							.tint(Colors.darkGray.color)
					}
			}
		}
		.font(Fonts.thirteen.bold)
	}
	
	private func button(isSelected: Bool) -> some View {
		Button {
			buttonAction()
		} label: {
			RoundedRectangle(cornerRadius: 10)
				.fill(
					isSelected ? Colors.orange.color : Colors.darkGray.color
				)
				.frame(width: 71, height: 30)
				.overlay {
					Text((capacities.first ?? "") + " Gb")
						.tint(
							isSelected ? Colors.white.color : Colors.darkGray.color
						)
				}
		}
	}
}

//struct StorageSelectionView_Previews: PreviewProvider {
//	static var previews: some View {
//		StorageSelectionView(capacities: ["128", "256"], buttonAction: {})
//	}
//}

//
//  TabBarView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct TabBarView: View {

	@ObservedObject var coordinator: CoordinatorObject
	
	var body: some View {
		VStack {
			Spacer()
			ZStack{
				RoundedRectangle(cornerRadius: 30)
					.fill(Colors.darkBlue.color)
					.frame(height: 72)
				HStack(spacing: 52) {
					Button {
						coordinator.homeScreen()
					} label: {
						HStack {
							Images.dot.image
							Text("Explorer")
						}
					}
					
					Button {
						coordinator.openCart()
					} label: {
						Images.bag.image
							.badge(coordinator.cartViewModel.count)
					}
					
					Button {
						
					} label: {
						Images.like.image
					}
					
					Button {
						
					} label: {
						Images.person.image
					}
				}
				.foregroundColor(.white)
			}
		}
		.ignoresSafeArea()
	}
	

}

struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		//		TabBarView(selection: .constant(.home), coordinator: CoordinatorObject(modelService: ModelService()))
		TabBarView(coordinator: CoordinatorObject.shared)
	}
}

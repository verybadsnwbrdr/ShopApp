//
//  TabBarTest.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//
//
import SwiftUI

struct TabBarTest: View {
	@ObservedObject var coordinator = CoordinatorObject.shared
	//	@State var selection:
	
	var body: some View {
		TabView {
			HomeView(viewModel: coordinator.homeViewModel)
				.tabItem {
					HStack(spacing: 52) {
						Button {
							coordinator.homeScreen()
						} label: {
							HStack {
								Images.dot.image
								Text("Explorer")
							}
						}
					}
				}
		}
		.background(
			Colors.darkBlue.color
//			RoundedRectangle(cornerRadius: 30)
//				.fill(Colors.darkBlue.color)
//				.frame(height: 72)
		)
	}
}

struct TabBarTest_Previews: PreviewProvider {
	static var previews: some View {
		TabBarTest()
	}
}

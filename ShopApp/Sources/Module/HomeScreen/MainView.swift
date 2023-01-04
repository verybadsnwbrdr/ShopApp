//
//  MainView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct MainView: View {
	
	@ObservedObject var viewModel: MainViewModel
	@State var text = String()
	@State var models = HomeScreenModel.mockModels
	var columns = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				TopHomeSubView()
					.padding([.leading, .trailing], 35)
				VStack {
					HeaderView(title: Localization.selectCategory.rawValue,
							   buttonTitle: Localization.viewAll.rawValue)
					
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(spacing: 18) {
							ForEach(viewModel.categories, id: \.category) { model in
								VStack {
									Circle()
										.frame(width: 71, height: 71)
										.foregroundColor(
											model.isSelected ? Colors.orange.color : .white
										)
										.overlay {
											model.image.image
										}
									Text(model.category)
										.foregroundColor(Colors.darkBlue.color)
										.font(Fonts.twelve.medium)
									
								}
								.onTapGesture {
									
								}
							}
						}
					}
				}
				.padding(.leading, 17)
				
				HStack {
					RoundedRectangle(cornerRadius: 50)
						.frame(height: 34)
						.foregroundColor(.white)
						.overlay {
							HStack {
								Images.search.image
								TextField(text: $text) {
									// MARK: - TextField width
									Localization.search.text
										.font(Fonts.twelve.regular)
								}
							}
							.offset(x: 24)
						}
					Circle()
						.frame(width: 34)
						.foregroundColor(Colors.orange.color)
						.overlay {
							Images.qrCode.image
						}
				}
				.padding([.leading, .trailing], 35)
				VStack {
					HeaderView(title: Localization.hotSales.rawValue,
							   buttonTitle: Localization.seeMore.rawValue)
					ZStack {
						ScrollView(.horizontal, showsIndicators: false) {
							HStack {
								ForEach(0..<3) { model in
									RoundedRectangle(cornerRadius: 10)
										.frame(width: 360, height: 180)
										.overlay(alignment: .bottomLeading) {
											VStack(alignment: .leading, spacing: 20) {
												Circle()
													.frame(width: 27)
													.foregroundColor(Colors.orange.color)
													.overlay {
														Localization.new.text
															.foregroundColor(.white)
															.font(Fonts.ten.systemBold)
													}
												VStack(spacing: 5) {
													Localization.iphone.text
														.foregroundColor(.white)
														.font(Fonts.twentyFive.systemBold)
													Localization.superMega.text
														.foregroundColor(.white)
														.font(Fonts.eleven.systemRegular)
												}
												
												Button(action: { }) {
													RoundedRectangle(cornerRadius: 5)
														.foregroundColor(.white)
														.frame(width: 98, height: 23)
														.overlay {
															Localization.buyNow.text
																.font(Fonts.eleven.systemBold)
																.foregroundColor(Colors.darkBlue.color)
														}
												}
											}
											.padding(.leading, 25)
											.padding(.bottom, 26)
										}
								}
							}
						}
					}
				}
				.padding(.leading, 17)
				
				VStack {
					HeaderView(title: Localization.bestSeller.rawValue,
							   buttonTitle: Localization.seeMore.rawValue)
					LazyVGrid(columns: columns, spacing: 14) {
						ForEach(0..<4) { model in
							RoundedRectangle(cornerRadius: 10)
								.foregroundColor(.white)
								.frame(height: 227)
								.overlay(alignment: .leading) {
									VStack(alignment: .leading) {
										Text("$1,047")
											.font(Fonts.sixteen.bold)
											.foregroundColor(Colors.darkBlue.color)
										Text("Samsung Galaxy s20 Ultra")
											.font(Fonts.ten.regular)
											.foregroundColor(Colors.darkBlue.color)
									}
									.padding(.leading, 21)
								}
								
						}
					}
					.padding(.trailing, 21)
				}
				.padding(.leading, 17)
			}
		}
		.background(
			Colors.backroundColor.color
		)
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(viewModel: MainViewModel(coordinator: CoordinatorObject()))
	}
}


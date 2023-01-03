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
	
    var body: some View {
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
//					Rectangle()
				}
			}

			.padding(.leading, 17)

			Spacer()

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


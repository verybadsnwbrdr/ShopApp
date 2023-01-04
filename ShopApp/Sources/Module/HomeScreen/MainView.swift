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
							ForEach($viewModel.categories, id: \.category) { model in
								CircleView(isSelected: model.isSelected,
										   radius: 71,
										   image: model.image.wrappedValue,
										   category: model.category.wrappedValue)
								.onTapGesture {
									model.isSelected.wrappedValue.toggle()
								}
							}
						}
					}
					.shadow(color: Colors.shadow.color,
							radius: 20)
				}
				.padding(.leading, 17)
				
				SearchAndQRView(text: $text)
				.padding([.leading, .trailing], 35)
				
				VStack {
					HeaderView(title: Localization.hotSales.rawValue,
							   buttonTitle: Localization.seeMore.rawValue)
					ScrollView(.horizontal, showsIndicators: false) {
						HStack {
							ForEach(0..<3) { model in
								HotSalesView(isNew: true,
											 title: Localization.iphone.rawValue,
											 subtitle: Localization.superMega.rawValue)
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
							BestSellerView(name: "Samsung Galaxy s20 Ultr",
										   discountPrice: 1047,
										   priceWithoutDiscount: 1500)
						}
					}
					.shadow(color: Colors.shadow.color,
							radius: 40)
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


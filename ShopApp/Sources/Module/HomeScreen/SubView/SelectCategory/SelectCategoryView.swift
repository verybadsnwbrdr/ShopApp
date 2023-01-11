//
//  SelectCategoryView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct SelectCategoryView: View {
	
	var categories: [HomeScreenModel]
	var action: (HomeScreenModel) -> ()
	
    var body: some View {
		VStack {
			HeaderView(title: Localization.selectCategory.rawValue,
					   buttonTitle: Localization.viewAll.rawValue)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 18) {
					ForEach(categories) { model in
						SelectCategoryCircleView(isSelected: model.isSelected,
								   image: model.image,
								   category: model.category)
						.frame(width: 71)
						.onTapGesture {
							action(model)
						}
					}
				}
				.padding(.trailing, 21)
			}
			.shadow(color: Colors.shadow.view,
					radius: 20)
		}
    }
}

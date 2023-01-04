//
//  SelectCategoryView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct SelectCategoryView: View {
	@Binding var categories: [HomeScreenModel]
	
    var body: some View {
		VStack {
			HeaderView(title: Localization.selectCategory.rawValue,
					   buttonTitle: Localization.viewAll.rawValue)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 18) {
					ForEach($categories, id: \.category) { model in
						CircleView(isSelected: model.isSelected,
								   radius: 71,
								   image: model.image.wrappedValue,
								   category: model.category.wrappedValue)
						.onTapGesture {
							model.isSelected.wrappedValue.toggle()
						}
					}
				}
				.padding(.trailing, 21)
			}
			.shadow(color: Colors.shadow.color,
					radius: 20)
		}
    }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
		SelectCategoryView(categories: .constant(HomeScreenModel.mockModels))
    }
}
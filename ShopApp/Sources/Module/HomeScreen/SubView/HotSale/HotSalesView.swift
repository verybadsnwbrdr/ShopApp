//
//  HotSalesView.swift
//  ShopApp
//
//  Created by Anton on 04.01.2023.
//

import SwiftUI

struct HotSalesView: View {
	var homeStores: [HomeStore]//@Binding
	var openDetail: () -> ()
	
	var body: some View {
		VStack {
			HeaderView(title: Localization.hotSales.rawValue,
					   buttonTitle: Localization.seeMore.rawValue)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(homeStores) { model in
						RoundedRectangle(cornerRadius: 10)
							.frame(width: 360, height: 180)
							.overlay(alignment: .leading) {
								AsyncImageView(stringURL: model.picture,
											   offset: (98, 0),
											   cornerRadius: 10)
							}
							.overlay(alignment: .bottomLeading) {
								HotSalesLeftPartView(isNew: model.isNew,
													 title: model.title,
													 subtitle: model.subtitle,
													 openDetail: openDetail)
								.padding(.leading, 25)
								.padding(.bottom, 26)
							}
						
					}
				}
				.padding(.trailing, 21)
			}
		}
	}
}

//struct HotSalesView_Previews: PreviewProvider {
//	static var previews: some View {
//		HotSalesView(viewModel: MainViewModel(coordinator: CoordinatorObject()))
//	}
//}

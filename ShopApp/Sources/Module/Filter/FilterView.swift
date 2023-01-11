//
//  FilterView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct FilterView: View {
	
	@ObservedObject var viewModel: FilterViewModel
	
    var body: some View {
		VStack(spacing: 22) {
			HStack {
				SquareRoundedButtonView(buttonAction: viewModel.close,
										image: Images.cancel,
										color: .darkBlue)
				Spacer()
				Localization.filterOptions.textView
					.tint(Colors.darkBlue.view)
				Spacer()
				TextButtonView(buttonAction: viewModel.close,
							   title: Localization.done.rawValue)
				.frame(width: 86, height: 37)
			}
			.font(Fonts.eighteen.medium)
			
			SectionsFilterView(sectionName: FilterLocalization.brand.rawValue,
							   filter: FilterLocalization.brandFilter.rawValue)
			
			SectionsFilterView(sectionName: FilterLocalization.price.rawValue,
							   filter: FilterLocalization.priceFilter.rawValue)
			
			SectionsFilterView(sectionName: FilterLocalization.size.rawValue,
							   filter: FilterLocalization.sizeFilter.rawValue)
		}
		.padding([.leading, .trailing], 35)
		.padding(.top, 24)
		.padding(.bottom, 44)
    }
}

fileprivate enum FilterLocalization: String {
	case brand = "Brand"
	case price = "Price"
	case size = "Size"
	
	case brandFilter = "Samsung"
	case priceFilter = "$300 - $500"
	case sizeFilter = "4.5 to 5.5 inches"
}

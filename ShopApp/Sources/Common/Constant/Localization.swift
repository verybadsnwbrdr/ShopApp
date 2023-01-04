//
//  Localization.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum Localization: String {
	case location = "Zihuatanejo, Gro"
	case selectCategory = "Select Category"
	case hotSales = "Hot sales"
	case viewAll = "view all"
	case seeMore = "see more"
	case search = "Search"
	case buyNow = "Buy now!"
	case new = "New"
	case iphone = "Iphone 12"
	case superMega = "Súper. Mega. Rápido."
	case bestSeller = "Best Seller"
	
	var text: Text { .init(rawValue) }
}

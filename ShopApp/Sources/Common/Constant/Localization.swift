//
//  Localization.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum Localization: String {
	
	// MARK: - HomeView
	
	case viewAll = "view all"
	case seeMore = "see more"
	case search = "Search"
	case location = "Zihuatanejo, Gro"
	case selectCategory = "Select Category"
	case hotSales = "Hot sales"
	case buyNow = "Buy now!"
	case new = "New"
	case bestSeller = "Best Seller"
	
	// MARK: - FilterView
	
	case filterOptions = "Filter options"
	case done = "Done"
	
	// MARK: - TabBar
	
	case explorer = "Explorer"
	
	// MARK: - DetailView
	
	case productDetails = "Product Details"
	case shop = "Shop"
	case details = "Details"
	case features = "Features"
	case selectColorAndCapacity = "Select color and capacity"
	case addToCard = "Add to card"
	
	// MARK: - CartView
	
	case myCart = "My Cart"
	case addAddress = "Add address"
	case total = "Total"
	case delivery = "Delivery"
	case checkOut = "Checkout"
	
	// MARK: - Init TextView
	
	var textView: Text { .init(rawValue) }
}

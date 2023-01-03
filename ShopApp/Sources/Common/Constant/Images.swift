//
//  Images.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum Images: String {
	case location
	case filter
	case chevronDown = "chevron.down"
	case qrCode
	case search
	
	case health
	case phone
	case computer
	case books
	
	var image: Image { .init(rawValue) }
	var sytemImage: Image { .init(systemName: rawValue) }
}


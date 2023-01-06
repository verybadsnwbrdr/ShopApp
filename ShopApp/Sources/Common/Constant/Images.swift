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
	
	case favouriteFill
	case favourite
	
	case dot
	case bag
	case like
	case person
	
	case cancel
	
	case star
	case ram
	case camera
	case core
	case sd
	case check
	
	var image: Image { .init(rawValue) }
	var sytemImage: Image { .init(systemName: rawValue) }
}


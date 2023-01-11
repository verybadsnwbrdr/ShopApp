//
//  Colors.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum Colors: String {
	case white
	case orange
	case darkBlue
	case lightGray
	case darkGray
	case backroundColor
	case shadow
	case incrementButtonColor
	
	var view: Color { .init(rawValue) }
}

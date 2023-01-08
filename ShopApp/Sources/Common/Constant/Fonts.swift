//
//  Fonts.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum Fonts: CGFloat {
	case thirtyFive = 35
	case twentyFive = 25
	case twenty = 20
	case eighteen = 18
	case sixteen = 16
	case fifteen = 15
	case thirteen = 13
	case twelve = 12
	case eleven = 11
	case ten = 10
	
	var heavy: Font {
		.custom("MarkPro-Heavy", size: rawValue)
	}
	
	var bold: Font {
		.custom("MarkPro-Bold", size: rawValue)
	}
	
	var medium: Font {
		.custom("MarkPro-Medium", size: rawValue)
	}
	
	var regular: Font {
		.custom("MarkPro-Regular", size: rawValue)
	}
	
	var systemBold: Font {
		.system(size: rawValue, weight: .bold)
	}
	
	var systemRegular: Font {
		.system(size: rawValue, weight: .regular)
	}
}

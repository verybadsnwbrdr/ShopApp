//
//  Fonts.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

enum Fonts: CGFloat {
	case twentyFive = 25
	case sixteen = 16
	case fifteen = 15
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
	
//	var uifont: UIFont? {
//		Font(.init(<#T##name: CFString##CFString#>, size: <#T##CGFloat#>))
//		.init(name: "MarkPro-Bold", size: rawValue) }
	
	var test: Font {
		.custom("Mark Pro", size: rawValue)
		.weight(.bold)
	}
}

//
//  Color+Extension.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import SwiftUI

extension Color {
	public init?(hex: String) {
		let r, g, b, a: CGFloat
		let hexColor = hex.replacingOccurrences(of: "#", with: "")
		var rgb: UInt64 = 0
		guard Scanner(string: hexColor).scanHexInt64(&rgb) else { return nil }
		
		if hexColor.count == 6 {
			r = CGFloat((rgb & 0xff0000) >> 16) / 255
			g = CGFloat((rgb & 0x00ff00) >> 8) / 255
			b = CGFloat(rgb & 0x0000ff) / 255
			a = 1
		} else if hexColor.count == 8 {
			r = CGFloat((rgb & 0xff000000) >> 24) / 255
			g = CGFloat((rgb & 0x00ff0000) >> 16) / 255
			b = CGFloat((rgb & 0x0000ff00) >> 8) / 255
			a = CGFloat(rgb & 0x000000ff) / 255
		} else {
			return nil
		}
		
		self.init(CGColor.init(red: r, green: g, blue: b, alpha: a))
		return
	}
}

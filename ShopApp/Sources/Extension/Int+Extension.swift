//
//  Int+Extension.swift
//  ShopApp
//
//  Created by Anton on 08.01.2023.
//

import Foundation

extension Int {
	func moneyDescription() -> String {
		guard self > 1000 else { return "$" + self.description + ".00"}
		var resultStr = (self / 1000).description + ","
		resultStr += self % 1000 == 0 ? "000" : (self % 1000).description
		return "$" + resultStr + ".00"
	}
}

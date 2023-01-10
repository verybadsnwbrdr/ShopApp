//
//  EndPoint.swift
//  ShopApp
//
//  Created by Anton on 10.01.2023.
//

import Foundation

enum EndPoint: String {
	case homeURL = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
	case detailURL = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
	case cartURL = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
	
	var optionalURL: URL? { URL(string: rawValue) }
}

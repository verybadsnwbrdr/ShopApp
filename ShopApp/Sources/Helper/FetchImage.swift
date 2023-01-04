//
//  FetchImage.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

extension Image {
	
	static func fetchImage(stringURL: String, complition: @escaping (Data) -> ()) {
		let urlStr = stringURL
		guard let url = URL(string: urlStr) else { return }
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else { return }
			complition(data)
		}.resume()
	}
}

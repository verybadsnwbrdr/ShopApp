//
//  ModelService.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import Foundation

class ModelService {
//	var bestSeller: [BestSeller] = []
//	var model: Model
//
//	init() {
//		fetchBestSeller()
//	}
	
	func fetchBestSeller(complition: @escaping (Model) -> ()) {
		let urlStr = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
		let url = URL(string: urlStr)!
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else { return }
			do {
				let decoded = try JSONDecoder().decode(Model.self, from: data)
				DispatchQueue.main.async {
					complition(decoded)
				}
			} catch {
				print("Ошибка при декодировке JSON")
			}
		}.resume()
	}
}

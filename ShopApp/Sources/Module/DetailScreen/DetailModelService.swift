//
//  DetailModelService.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import Foundation
import Combine

final class DetailModelService: FetchableProtocol {
//	func fetch(from url: URL) -> AnyPublisher<DetailModel, Never> {
//		URLSession.shared.dataTaskPublisher(for: url)
//			.map { $0.data }
//			.decode(type: , decoder: <#T##TopLevelDecoder#>)
//	}

	
	func fetchBestSeller(complition: @escaping (DetailModel) -> ()) {
		let urlStr = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
		guard let url = URL(string: urlStr) else { return }
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else { return }
			do {
				let decoded = try JSONDecoder().decode(DetailModel.self, from: data)
				DispatchQueue.main.async {
					complition(decoded)
				}
			} catch {
				print("Ошибка при декодировке JSON")
			}
		}.resume()
	}
	
}

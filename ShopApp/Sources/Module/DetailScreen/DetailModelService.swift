//
//  DetailModelService.swift
//  ShopApp
//
//  Created by Anton on 06.01.2023.
//

import Foundation
import Combine

class DetailModelService {
	
//	func fetchData(_ stringURL: String) -> AnyPublisher<DetailModel, Never> {
//		guard let url = URL(string: stringURL) else {
//			return Empty()
//				.eraseToAnyPublisher()
//		}
//		return URLSession.shared.dataTaskPublisher(for: url)
//			.compactMap { $0.data }
//			.decode(type: DetailModel.self, decoder: JSONDecoder())
//			.catch { _ in Empty() }
//			.eraseToAnyPublisher()
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

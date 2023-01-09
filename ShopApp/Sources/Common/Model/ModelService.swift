//
//  ModelService.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import Foundation
import Combine

class ModelService {
	
	@Published var models: [Model] = []
	private var cancellables: Set<AnyCancellable> = []

	func fetchBestSeller(complition: @escaping (Model) -> ()) {
		let urlStr = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
		guard let url = URL(string: urlStr) else { return }
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
	
	func fetch(from url: URL) -> AnyPublisher<Model, Never> {
		URLSession.shared.dataTaskPublisher(for: url)
			.map { $0.data }
			.decode(type: Model.self, decoder: JSONDecoder())
			.catch { _ in Empty() }
			.eraseToAnyPublisher()
//			Just(<#T##output: Output##Output#>)
//			.sink { _ in }
//				receiveValue: { [unowned self] decodedModels in
//					models = decodedModels
//			}
				
//			.store(in: &cancellables)
	}
	
	func fetchImage(stringURL: String, complition: @escaping (Data) -> ()) {
		guard let url = URL(string: stringURL) else { return }
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else { return }
			complition(data)
		}.resume()
	}
}

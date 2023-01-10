//
//  FetchableProtocol.swift
//  ShopApp
//
//  Created by Anton on 10.01.2023.
//

import Foundation
import Combine

protocol Fetchable  {
	func fetch<T: Decodable>(from url: URL?) -> AnyPublisher<T, Never>
}

extension Fetchable {
	func fetch<T: Decodable>(from url: URL?) -> AnyPublisher<T, Never> {
		guard let url = url else { return Empty().eraseToAnyPublisher() }
		return URLSession.shared.dataTaskPublisher(for: url)
			.map { $0.data }
			.decode(type: T.self, decoder: JSONDecoder())
			.catch { _ in Empty() }
			.eraseToAnyPublisher()
	}
}


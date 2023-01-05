//
//  AsyncImage+Extension.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

extension AsyncImage {
	func cropped(offset: (x: CGFloat, y: CGFloat) = (0, 0),
				 cornerRadius: CGFloat) -> some View {
		GeometryReader { geo in
			self
				.offset(x: offset.x, y: offset.y)
				.frame(width: geo.size.width,
					   height: geo.size.height)
				.cornerRadius(cornerRadius)
				.clipped()
		}
	}
}

//
//  AsyncImageView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct AsyncImageView: View {
	var stringURL: String
	var offset: (x: CGFloat, y: CGFloat) = (0, 0)
	var cornerRadius: CGFloat = 0
	
    var body: some View {
		AsyncImage(url: URL(string: stringURL)) { image in
			image
				.resizable()
				.scaledToFit()
		} placeholder: {
			ProgressView()
		}
		.cropped(offset: offset, cornerRadius: cornerRadius)
    }
}

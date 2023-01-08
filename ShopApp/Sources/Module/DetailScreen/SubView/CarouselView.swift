//
//  CarouselView.swift
//  ShopApp
//
//  Created by Anton on 07.01.2023.
//

import SwiftUI

struct CarouselView: View {
	@Binding var images: [String]
	private let screenWidth = UIScreen.main.bounds.width

    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 5) {
				ForEach(images, id: \.self) { item in
					GeometryReader { proxy in
						let scale = getScale(proxy: proxy)
						RoundedRectangle(cornerRadius: 20)
							.fill(.white)
							.clipped()
							.overlay {
								AsyncImageView(stringURL: item, cornerRadius: 20)
									.padding(5)
							}
							.scaleEffect(CGSize(width: scale, height: scale))
					}
					.frame(width: screenWidth / 3 * 2)
				}
			}
		}
    }
	
	private func getScale(proxy: GeometryProxy) -> CGFloat {
		let midX = proxy.frame(in: .global).midX
		let center = screenWidth / 2
		let test = ((midX > 0 && midX < screenWidth) ? abs(center - midX) : center) / (screenWidth * 2)
		return 1 - test
	}
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
		CarouselView(images: .constant([
			"https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
			"https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
			"https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"
		]))
    }
}

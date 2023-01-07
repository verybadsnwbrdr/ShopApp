//
//  CarouselView.swift
//  ShopApp
//
//  Created by Anton on 07.01.2023.
//

import SwiftUI

struct CarouselView: View {
	@Binding var images: [String]
	
	private func getScale(proxy: GeometryProxy) -> CGFloat {
//		var scale: CGFloat = 1.2
		let midX = proxy.frame(in: .global).midX
		let size = UIScreen.main.bounds.width
		let center = size / 2
		let test = ((midX > 0 && midX < size) ? abs(center - midX) : center) / (size * 1.8)
		return 1.2 - test
	}
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 50) {
				ForEach(images, id: \.self) { item in
					GeometryReader { proxy in
						let scale = getScale(proxy: proxy)
						RoundedRectangle(cornerRadius: 20)
							.fill(.white)
							.frame(width: 240)
							.clipped()
							.overlay {
								AsyncImageView(stringURL: item, cornerRadius: 20)
									.padding(8)
							}
							.scaleEffect(CGSize(width: scale, height: scale))
					}
					.frame(width: 230, height: 260)
				}
			}
			.padding(32)
		}
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

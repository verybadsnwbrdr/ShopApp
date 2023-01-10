//
//  TabBarView.swift
//  ShopApp
//
//  Created by Anton on 05.01.2023.
//

import SwiftUI

struct TabBarView<Content: View>: View {
	
	@ObservedObject var coordinator: CoordinatorObject
	@State private var tabs: [TabItem] = [
		.init(text: Localization.explorer.rawValue, image: .dot, tab: .detail),
		.init(image: .bag, tab: .cart),
		.init(image: .like, tab: .another),
		.init(image: .person, tab: .another)
	]
	
	private var content: Content
	
	init(coordinator: CoordinatorObject, @ViewBuilder content: () -> Content) {
		self.coordinator = coordinator
		self.content = content()
	}
	
	var body: some View {
		ZStack(alignment: .bottom) {
			content
				.padding(.bottom, 80)
			HStack(spacing: 52) {
				tabsView
			}
			.frame(height: 72)
			.frame(maxWidth: .infinity)
			.background(Colors.darkBlue.color.ignoresSafeArea(edges: .bottom))
			.cornerRadius(30)
		}
		.background(Colors.backroundColor.color, ignoresSafeAreaEdges: .all)
		.ignoresSafeArea()
	}
	
	private var tabsView: some View {
		ForEach(tabs) { element in
			HStack {
				element.image.image
					.badge(element.tab == .cart ? coordinator.cartViewModel.model.basket.count : 0)
				if let text = element.text {
					Text(text)
				}
			}
			.foregroundColor(.white)
			.onTapGesture {
				withAnimation {
					coordinator.open(element.tab)
				}
			}
		}
	}
}

extension TabBarView {
	struct TabItem: Identifiable, Equatable {
		var id = UUID()
		var text: String?
		var image: Images
		var tab: CoordinatorTab
	}
}

//struct TabBarView_Previews: PreviewProvider {
//	static var previews: some View {
//		TabBarView(coordinator: CoordinatorObject.shared) {
//			Color.red
//		}
//	}
//}


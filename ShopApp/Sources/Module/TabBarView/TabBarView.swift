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
		.init(text: Localization.explorer.rawValue, image: .dot, tab: .home),
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
			.background(Colors.darkBlue.view.ignoresSafeArea(edges: .bottom))
			.cornerRadius(30)
		}
		.background(Colors.backroundColor.view, ignoresSafeAreaEdges: .all)
		.ignoresSafeArea()
	}
	
	private var tabsView: some View {
		ForEach(tabs) { element in
			HStack {
				element.image.image
					.badge(element.tab == .cart ? coordinator.cartModelService.model.basket.count : 0)
				if let text = element.text {
					Text(text)
				}
			}
			.foregroundColor(.white)
			.onTapGesture {
				withAnimation {
					self.coordinator.open(element.tab)
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


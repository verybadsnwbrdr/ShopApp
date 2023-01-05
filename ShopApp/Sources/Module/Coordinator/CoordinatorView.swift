//
//  CoordinatorView.swift
//  ShopApp
//
//  Created by Anton on 03.01.2023.
//

import SwiftUI

struct CoordinatorView: View {
	
	@ObservedObject var coordinator: CoordinatorObject
	
    var body: some View {
		ZStack {
			HomeView(viewModel: HomeViewModel(coordinator: CoordinatorObject()))
				.padding(.bottom, 45)
			TabBarView()
		}
		.background(
			Colors.backroundColor.color
		)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
		CoordinatorView(coordinator: CoordinatorObject())
    }
}

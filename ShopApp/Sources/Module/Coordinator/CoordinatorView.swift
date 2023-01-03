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
		Text("")
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
		CoordinatorView(coordinator: CoordinatorObject())
    }
}

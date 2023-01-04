////
////  SelectHomeSubView.swift
////  ShopApp
////
////  Created by Anton on 03.01.2023.
////
//
//import SwiftUI
//
//struct SelectHomeSubView: View {
//    var body: some View {
//		VStack {
//			HStack {
//				Localization.selectCategory.text
//					.font(Fonts.twentyFive.bold)
//					.foregroundColor(Colors.darkBlue.color)
//				Spacer()
//				Button(action: {}) {
//					Localization.viewAll.text
//						.font(Fonts.fifteen.regular)
//						.foregroundColor(Colors.orange.color)
//				}
//			}
//			.padding(.trailing, 33)
//			
//			ScrollView(.horizontal, showsIndicators: false) {
//				HStack(spacing: 18) {
//					ForEach(viewModel.categories, id: \.category) { model in
//						VStack {
//							Circle()
//								.frame(width: 71, height: 71)
//								.foregroundColor(
//									model.isSelected ? Colors.orange.color : .white
//								)
//								.overlay {
//									model.image.image
//								}
//							Text(model.category)
//								.foregroundColor(Colors.darkBlue.color)
//								.font(Fonts.twelve.medium)
//							
//						}
//						.onTapGesture {
//							
//						}
//					}
//				}
//			}
//		}
//		.padding(.leading, 17)
//    }
//}
//
//struct SelectHomeSubView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectHomeSubView()
//    }
//}

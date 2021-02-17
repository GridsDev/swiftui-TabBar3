//
//  TabBarView.swift
//  swiftui-TabBar3
//
//  Created by Grids Jivapong on 17/2/2564 BE.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selection: Int
    
    @Namespace private var currentTab
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            
            ForEach(tabs.indices) { index in
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        if selection == index {
                            Color(.label)
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }
                        if tabs[selection].label == "Notifications" && tabs[index].label == "Notifications" {
                            Image(systemName: tabs[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(25))
                        } else {
                            Image(systemName: tabs[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(0))
                        }
                        // ปรับแต่งตัวหนังสือ
                        Text(tabs[index].label)
                            .font(.caption2)
                            .fixedSize()
                        
                    }
                    // ปรับขนาด Bottom
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geometry.size.width / 2, height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(selection == index ? Color(.label) : .secondary)
                    
                    .onTapGesture {
                        withAnimation {
                            selection = index
                        }
                    }
                }
                .frame(height: 44, alignment: .bottom)
            }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: Binding.constant(0))
            .previewLayout(.sizeThatFits)
    }
}

struct Tab {
    let image: String
    let label: String
}

let tabs = [
    Tab(image: "house.fill", label: "Home"),
    Tab(image: "person.2.fill", label: "My Network"),
    Tab(image: "plus.square.fill", label: "Post"),
    Tab(image: "bell.fill", label: "Notifications"),
    Tab(image: "briefcase.fill", label: "Jobs")
]

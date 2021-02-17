//
//  ContentView.swift
//  swiftui-TabBar3
//
//  Created by Grids Jivapong on 17/2/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        VStack {
            
            TabView(selection: $selection) {
                
                Text("Home")
                    .tag(0)
                Text("My Network")
                    .tag(1)
                Text("Post")
                    .tag(2)
                Text("Notyifications")
                    .tag(3)
                Text("Jobs")
                    .tag(4)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Divider()
            TabBarView(selection: $selection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  HomeView.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @Environment(\.colorScheme) var current
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            TabView(selection: $model.viewShown) {
                Map().tag(0)
                    .ignoresSafeArea()
                
                OverviewView().tag(1)
                
                Map().tag(2)
                    .ignoresSafeArea()
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
            
            NavigationBar()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}

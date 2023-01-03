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
                ListsView().tag(0)
                
                OverviewView().tag(1)
                
                LearnView().tag(2)
                
                SettingsView().tag(3)
            }
            
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

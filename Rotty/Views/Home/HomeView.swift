//
//  HomeView.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                NavigationBar()
                
                Map()
                    .frame(height: 600)
                    .mask(
                        RoundedRectangle(cornerRadius: 30)
                    )
                    .padding()
                
                HStack(spacing: 0) {
                    Button(action: {
                        model.onboardingShown = false
                    }, label: {
                        Text("Go back ")
                    })
                    
                    Text("to onboarding")
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}

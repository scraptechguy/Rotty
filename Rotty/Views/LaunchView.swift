//
//  LaunchView.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        if model.onboardingShown {
            
            HomeView()
            
        } else {
            
            Button(action: {
                model.onboardingShown = true
            }, label: {
               Text("Next")
            })
            
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}

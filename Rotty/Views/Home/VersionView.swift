//
//  VersionView.swift
//  Rotty
//
//  Created by Rostislav Brož on 1/9/23.
//

import SwiftUI

struct VersionView: View {
    
    @EnvironmentObject var model: ContentModel
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                if model.isDarkMode {
                    
                    Image("RottyAppIconSVG")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .mask(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .gray, radius: 40)
                    
                } else {
                    
                    Image("RottyAppIconSVG")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .mask(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 40)
                    
                }
                
                Spacer()
                
                Text("Version 1.0.0")
                    .fontWeight(model.fontIsBold ? .bold : .regular)
                    .foregroundColor(model.isHighContrast ? .primary : .secondary)
                
                Text("Build: 5")
                    .font(.footnote)
                    .fontWeight(model.fontIsBold ? .bold : .regular)
                    .foregroundColor(model.isHighContrast ? .primary : .secondary)
                    .padding(.bottom)
                
                Text("Copyright 2023 Rostislav Brož")
                    .font(.footnote)
                    .fontWeight(model.fontIsBold ? .bold : .regular)
                    .foregroundColor(model.isHighContrast ? .primary : .secondary)
            }.padding(.bottom, screenSize.height / 11)
        }
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView()
            .environmentObject(ContentModel())
    }
}

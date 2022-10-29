//
//  MissionsView.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/29/22.
//

import SwiftUI

struct MissionsView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    HomeView().showingMissionsView = false
                }, label: {
                    Image(systemName: "multiply")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 12, height: 12)
                        .padding(12)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(Color("AccentColor"))
                        }
                        .padding(.trailing, 15)
                })
            }.padding(.leading, 15)
                .padding(.top, 15)
                .frame(maxHeight: .infinity, alignment: .top)
            
            Text("My missions")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Font"))
                .padding(.top, 15)
                .frame(maxHeight: .infinity, alignment: .top)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
        }
    }
}

struct MissionsView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsView()
    }
}

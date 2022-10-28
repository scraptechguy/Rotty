//
//  HelpView.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/28/22.
//

import SwiftUI

struct HelpView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var index: Int = 0
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $index) {
                    Image("Blob")
                        .resizable()
                        .scaledToFit()
                        .tag(0)
                    
                    Image("Blob")
                        .resizable()
                        .scaledToFit()
                        .tag(1)
                    
                    Image("Blob")
                        .resizable()
                        .scaledToFit()
                        .tag(2)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 500)
                
                Button(action: {
                    withAnimation {
                        if index < 2 {
                            index += 1
                        }
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 55, height: 55)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(Color("AccentColor"))
                        }
                        .padding(.top, 80)
                })
            }
            
            HStack {
                Button(action: {
                    withAnimation {
                        if index > 0 {
                            index -= 1
                        }
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Font"))
                })
                
                Spacer()
                
                Button(action: {
                    HomeView().showingHelpView = false
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
            
            Text("Help")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Font"))
                .padding(.top, 15)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

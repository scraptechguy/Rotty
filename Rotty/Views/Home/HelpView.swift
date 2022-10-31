//
//  HelpView.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/28/22.
//

import SwiftUI

struct HelpView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State private var index: Int = 0
    @State private var screenIsLast = false
    
    let helpViewButton: LocalizedStringKey = "helpViewButton"
    
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
                
                ZStack {
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .scaleEffect(!screenIsLast ? 1 : 0.001)
                        .opacity(!screenIsLast ? 1 : 0)
                    
                    HStack {
                        Text(helpViewButton)
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }.padding(.horizontal, 15)
                        .scaleEffect(screenIsLast ? 1 : 0.001)
                        .frame(height: screenIsLast ? nil : 0)
                        .opacity(screenIsLast ? 1 : 0)
                }.frame(width: screenIsLast ? 200 : 55, height: screenIsLast ? 50 : 55)
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: screenIsLast ? 10 : 30, style: screenIsLast ? .continuous : .circular)
                            .fill(Color("AccentColor"))
                    }
                    .onTapGesture {
                        withAnimation {
                            if index < 2 {
                                
                                index += 1
                                
                            }
                            
                            if screenIsLast {
                                
                                model.showingHelpView = false
                                
                            }
                            
                            if index == 2 {
                                
                                screenIsLast = true
                                
                            } else {
                                
                                screenIsLast = false
                                
                            }
                        }
                    }
                    .offset(y: screenIsLast ? 70 : 20)
                    .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: screenIsLast)
            }
            
            HStack {
                Button(action: {
                    withAnimation {
                        if index > 0 {
                            
                            index -= 1
                            
                        }
                        
                        screenIsLast = false
                    }
                }, label: {
                    if index == 0 {
                        
                    } else {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Font"))
                    }
                })
                
                Spacer()
                
                Button(action: {
                    model.showingHelpView = false
                    
                    screenIsLast = false
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
        }.preferredColorScheme(model.isDarkMode ? .dark : .light)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
            .environmentObject(ContentModel())
    }
}

//
//  NavigationBar.swift
//  Rotty
//
//  Created by Rostislav Brož on 12/3/22.
//

import SwiftUI

struct NavigationBar: View {
    
    @EnvironmentObject var model: ContentModel
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 0
                                    }
                                }, label: {
                                    VStack {
                                        if model.viewShown == 0 {
                                            Image(systemName: "list.bullet.circle")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                            Text("Lists")
                                                .foregroundColor(Color("Font"))
                                                .font(.footnote)
                                        } else {
                                            Image(systemName: "list.bullet.circle")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(.secondary)
                                            
                                            Text("Lists")
                                                .foregroundColor(.secondary)
                                                .font(.footnote)
                                        }
                                    }
                        })
                    }
                    
                    Spacer()
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 1
                                    }
                                }, label: {
                                    VStack {
                                        if model.viewShown == 1 {
                                            Image(systemName: "house")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                            Text("Overview")
                                                .foregroundColor(Color("Font"))
                                                .font(.footnote)
                                        } else {
                                            Image(systemName: "house")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(.secondary)
                                            
                                            Text("Overview")
                                                .foregroundColor(.secondary)
                                                .font(.footnote)
                                        }
                                    }
                        })
                    }
                    
                    Spacer()
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.viewShown = 2
                                    }
                                }, label: {
                                    VStack {
                                        if model.viewShown == 2 {
                                            Image(systemName: "map")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                            Text("Map")
                                                .foregroundColor(Color("Font"))
                                                .font(.footnote)
                                        } else {
                                            Image(systemName: "map")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(.secondary)
                                            
                                            Text("Map")
                                                .foregroundColor(.secondary)
                                                .font(.footnote)
                                        }
                                    }
                        })
                    }
                    
                    Spacer()
                }.frame(width: screenSize.width, height: screenSize.height / 10)
                    .background {
                        Rectangle()
                            .fill(Color("Background"))
                    }
            }.ignoresSafeArea()
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .environmentObject(ContentModel())
    }
}

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
            VStack(spacing: 0) {
                Spacer()
                
                Divider()
                
                HStack(alignment: .top) {
                    Divider()
                    
                    Spacer()
                    
                    Group {
                        Button(action: {
                                    model.viewShown = 0
                                }, label: {
                                    VStack {
                                        if model.viewShown == 0 {
                                            Image(systemName: "books.vertical")
                                                .resizable()
                                                .frame(width: 24, height: 22)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                            Text("Lists")
                                                .foregroundColor(Color("Font"))
                                                .font(.footnote)
                                        } else {
                                            Image(systemName: "books.vertical")
                                                .resizable()
                                                .frame(width: 24, height: 22)
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
                                    model.viewShown = 1
                                }, label: {
                                    VStack {
                                        if model.viewShown == 1 {
                                            Image(systemName: "lines.measurement.horizontal")
                                                .resizable()
                                                .frame(width: 22, height: 22)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                            Text("Overview")
                                                .foregroundColor(Color("Font"))
                                                .font(.footnote)
                                        } else {
                                            Image(systemName: "lines.measurement.horizontal")
                                                .resizable()
                                                .frame(width: 22, height: 22)
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
                                    model.viewShown = 2
                                }, label: {
                                    VStack {
                                        if model.viewShown == 2 {
                                            Image(systemName: "book")
                                                .resizable()
                                                .frame(width: 26, height: 22)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                            Text("Learn")
                                                .foregroundColor(Color("Font"))
                                                .font(.footnote)
                                        } else {
                                            Image(systemName: "book")
                                                .resizable()
                                                .frame(width: 26, height: 22)
                                                .foregroundColor(.secondary)
                                            
                                            Text("Learn")
                                                .foregroundColor(.secondary)
                                                .font(.footnote)
                                        }
                                    }
                        })
                    }
                    
                    Spacer()
                    
                    Group {
                        Button(action: {
                                    model.viewShown = 3
                                }, label: {
                                    VStack {
                                        if model.viewShown == 3 {
                                            Image(systemName: "gear")
                                                .resizable()
                                                .frame(width: 22, height: 22)
                                                .foregroundColor(Color("AccentColor"))
                                            
                                            Text("Settings")
                                                .foregroundColor(Color("Font"))
                                                .font(.footnote)
                                        } else {
                                            Image(systemName: "gear")
                                                .resizable()
                                                .frame(width: 22, height: 22)
                                                .foregroundColor(.secondary)
                                            
                                            Text("Settings")
                                                .foregroundColor(.secondary)
                                                .font(.footnote)
                                        }
                                    }
                        })
                    }
                    
                    Spacer()
                }.frame(width: screenSize.width, height: screenSize.height / 11.5)
                    .padding(.top)
                    .background {
                        Rectangle()
                            .fill(.ultraThinMaterial)
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

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
                                                .frame(width: 22, height: 20)
                                                .foregroundColor(Color("AccentColor"))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Lists")
                                                .foregroundColor(Color("Font"))
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                        } else {
                                            Image(systemName: "books.vertical")
                                                .resizable()
                                                .frame(width: 22, height: 20)
                                                .foregroundColor(.secondary)
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Lists")
                                                .foregroundColor(.secondary)
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
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
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color("AccentColor"))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Overview")
                                                .foregroundColor(Color("Font"))
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                        } else {
                                            Image(systemName: "lines.measurement.horizontal")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.secondary)
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Overview")
                                                .foregroundColor(.secondary)
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
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
                                                .frame(width: 24, height: 20)
                                                .foregroundColor(Color("AccentColor"))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Learn")
                                                .foregroundColor(Color("Font"))
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                        } else {
                                            Image(systemName: "book")
                                                .resizable()
                                                .frame(width: 24, height: 20)
                                                .foregroundColor(.secondary)
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Learn")
                                                .foregroundColor(.secondary)
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
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
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color("AccentColor"))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Settings")
                                                .foregroundColor(Color("Font"))
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                        } else {
                                            Image(systemName: "gear")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.secondary)
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                            
                                            Text("Settings")
                                                .foregroundColor(.secondary)
                                                .font(.system(size: 12))
                                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                        }
                                    }
                        })
                    }
                    
                    Spacer()
                }.frame(height: screenSize.height / 11.5)
                    .frame(maxWidth: .infinity)
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

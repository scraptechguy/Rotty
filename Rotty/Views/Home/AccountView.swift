//
//  AccountView.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/27/22.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView() {
                VStack(spacing: 10) {
                    Image("Ancaaaa")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(5)
                        .overlay(Circle().stroke(Color("AccentColor"), style: StrokeStyle(lineWidth: 2, dash: [5, 7])))
                    
                    Text("Anicka")
                        .font(.title3)
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            
                        }, label: {
                            Text("Recycling knight")
                                .font(.headline)
                        })
                        
                        Text(" Level 6")
                    }
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("AccentColor"))
                                .frame(height: 220)
                                .mask(
                                    RoundedRectangle(cornerRadius: 30)
                                )
                            
                            VStack(spacing: 10) {
                                Text("You saved")
                                    .font(.title3)
                                
                                Image(systemName: "chart.bar")
                                    .resizable()
                                    .frame(width: 35, height: 30)
                                
                                Text("6 kg")
                                    .bold()
                                    .font(.title2)
                                
                                Text("of waste")
                            }.foregroundColor(.white)
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(.clear)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                            
                            VStack(spacing: 10) {
                                HStack {
                                    Image(systemName: "bell")
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Text("Notifications")
                                }.padding(.bottom, 10)
                                
                                Text("Today")
                                    .font(.headline)
                                
                                Text("Lorem ipsum dolor sit amet, consectetur")
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                
                                Text("25. 5.")
                                    .font(.headline)
                                
                                Text("Lorem ipsum dolor sit amet, consectetur")
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                            }.padding(.horizontal)
                        }
                    }.padding(.top, 25)
                        .padding(.horizontal)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("AccentColor"))
                            .frame(height: 160)
                            .mask(
                                RoundedRectangle(cornerRadius: 30)
                            )
                        
                        VStack {
                            Text("Current level: Recycling knight")
                                .font(.headline)
                            
                            HStack {
                                Image(systemName: "figure.fencing")
                                    .resizable()
                                    .frame(width: 20, height: 28)
                                    .padding()
                                    .overlay(Circle().stroke(.white, style: StrokeStyle(lineWidth: 2, dash: [5, 4])))
                                
                                VStack {
                                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                    
                                    Button(action: {
                                        
                                    }, label: {
                                        Text("My missions")
                                            .foregroundColor(Color("Font"))
                                            .padding(9)
                                            .background {
                                                RoundedRectangle(cornerRadius: 30)
                                            }
                                    })
                                }.frame(width: 200)
                            }
                        }.foregroundColor(.white)
                    }.padding(.horizontal)
                }.padding(.top, 40)
            }.refreshable {
                
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 12, height: 12)
                            .padding(12)
                            .background {
                                RoundedRectangle(cornerRadius: 30, style: .circular)
                                    .fill(Color("AccentColor"))
                            }
                            .padding(.trailing, 15)
                    })
                }
                
                Spacer()
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(ContentModel())
    }
}

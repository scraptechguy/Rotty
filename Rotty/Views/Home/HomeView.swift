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
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    VStack {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "questionmark")
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
                        }
                        
                        Spacer()
                    }
                    
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
                        }.frame(maxWidth: .infinity)
                        
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color("AccentColor"))
                                    .mask(
                                        RoundedRectangle(cornerRadius: 30)
                                    )
                                
                                HStack(spacing: 10) {
                                    VStack {
                                        Image(systemName: "chart.bar")
                                            .resizable()
                                            .frame(width: 35, height: 30)
                                        
                                        Text("6 kg")
                                            .bold()
                                            .font(.title2)
                                    }
                                    
                                    Text("of waste\nsaved")
                                        .multilineTextAlignment(.center)
                                }.foregroundColor(.white)
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            HStack {
                                Button(action: {
                                    
                                }, label: {
                                    VStack {
                                        Image(systemName: "cloud")
                                            .padding()
                                            .frame(width: 80, height: 80)
                                            .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color("AccentColor"), lineWidth: 2))
                                        
                                        Text("Github")
                                            .font(.footnote)
                                    }
                                })
                                
                                Button(action: {
                                    
                                }, label: {
                                    VStack {
                                        Image(systemName: "camera")
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(width: 80, height: 80)
                                            .background {
                                                RoundedRectangle(cornerRadius: 28)
                                                    .fill(Color("AccentColor"))
                                            }
                                        
                                        Text("Camera")
                                            .font(.footnote)
                                    }
                                })
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        }.frame(maxWidth: .infinity)
                    }.frame(height: 220)
                        .padding(.top, 25)
                        .padding(.horizontal)
                    
                    Map()
                        .frame(height: 160)
                        .mask(
                            RoundedRectangle(cornerRadius: 30)
                        )
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
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
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            model.onboardingShown = false
                        }, label: {
                            Text("Go back ")
                        })
                       
                        Text("to onboarding")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack(spacing: 0) {
                         Text("Version ")
                            .foregroundColor(.secondary)
                        
                        Text("1.0.0")
                            .foregroundColor(Color("AccentColor"))
                    }
                }
            }.refreshable {
                
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

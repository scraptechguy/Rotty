//
//  MissionsView.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/29/22.
//

import SwiftUI

struct MissionsView: View {
    
    @State var showViews: [Bool] = Array(repeating: false, count: 8)
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(Color("AccentColor"))
                        }
                        
                    Text("Beginner ecologist")
                        .font(.title3)
                        .foregroundColor(Color("Font"))
                }.frame(width: 260, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                    .padding(.top, 7)
                    .opacity(showViews[0] ? 1 : 0)
                    .offset(y: showViews[0] ? 0 : 200)
                
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(Color("AccentColor"))
                        }
                        
                    Text("Gardener")
                        .font(.title3)
                        .foregroundColor(Color("Font"))
                }.frame(width: 260, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                    .opacity(showViews[1] ? 1 : 0)
                    .offset(y: showViews[1] ? 0 : 200)
                
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(Color("AccentColor"))
                        }
                        
                    Text("Responsible ecologist")
                        .font(.title3)
                        .foregroundColor(Color("Font"))
                }.frame(width: 260, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                    .opacity(showViews[2] ? 1 : 0)
                    .offset(y: showViews[2] ? 0 : 200)
                
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(Color("AccentColor"))
                        }
                        
                    Text("Biosphere saviour")
                        .font(.title3)
                        .foregroundColor(Color("Font"))
                }.frame(width: 260, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                    .opacity(showViews[3] ? 1 : 0)
                    .offset(y: showViews[3] ? 0 : 200)
                
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(Color("AccentColor"))
                        }
                        
                    Text("Environmental activist")
                        .font(.title3)
                        .foregroundColor(Color("Font"))
                }.frame(width: 260, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                    .opacity(showViews[4] ? 1 : 0)
                    .offset(y: showViews[4] ? 0 : 200)
                
                HStack {
                    Image(systemName: "figure.fencing")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                        .padding(10)
                        .overlay(Circle().stroke(.white, style: StrokeStyle(lineWidth: 2, dash: [5, 4])))
                        .padding(.horizontal, 10)
                        
                    Text("Recycling knight")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }.frame(width: 300, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background {
                        Rectangle()
                            .fill(Color("AccentColor"))
                            .mask(
                                RoundedRectangle(cornerRadius: 30)
                            )
                    }
                    .opacity(showViews[5] ? 1 : 0)
                    .offset(y: showViews[5] ? 0 : 200)
                
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .foregroundColor(.secondary)
                        .frame(width: 15, height: 18)
                        .padding(3)
                        
                    Text("Mr. Compost")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }.frame(width: 260, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.secondary, lineWidth: 2))
                    .opacity(showViews[6] ? 1 : 0)
                    .offset(y: showViews[6] ? 0 : 200)
                
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .foregroundColor(.secondary)
                        .frame(width: 15, height: 18)
                        .padding(3)
                        
                    Text("Greta Thunberd the 2nd")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }.frame(width: 260, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(.secondary, lineWidth: 2))
                    .opacity(showViews[7] ? 1 : 0)
                    .offset(y: showViews[7] ? 0 : 200)
            }.padding(.top, 63)
                .onAppear(perform: animateViews)
            
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
    
    func animateViews() {
        withAnimation(.easeInOut) {
            showViews[0] = true
        }
        
        withAnimation(.easeInOut.delay(0.1)) {
            showViews[1] = true
        }
        
        withAnimation(.easeInOut.delay(0.15)) {
            showViews[2] = true
        }
        
        withAnimation(.easeInOut.delay(0.2)) {
            showViews[3] = true
        }
        
        withAnimation(.easeInOut.delay(0.25)) {
            showViews[4] = true
        }
        
        withAnimation(.easeInOut.delay(0.35)) {
            showViews[5] = true
        }
        
        withAnimation(.easeInOut.delay(0.4)) {
            showViews[6] = true
        }
        
        withAnimation(.easeInOut.delay(0.45)) {
            showViews[7] = true
        }
    }
}

struct MissionsView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsView()
    }
}

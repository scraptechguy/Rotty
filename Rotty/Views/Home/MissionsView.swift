//
//  MissionsView.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/29/22.
//

import SwiftUI

struct MissionsView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var showViews: [Bool] = Array(repeating: false, count: 8)
    
    let myMissionsHeading: LocalizedStringKey = "myMissionsHeading"
    
    let level1: LocalizedStringKey = "level1"
    let level2: LocalizedStringKey = "level2"
    let level3: LocalizedStringKey = "level3"
    let level4: LocalizedStringKey = "level4"
    let level5: LocalizedStringKey = "level5"
    let level6: LocalizedStringKey = "level6"
    let level7: LocalizedStringKey = "level7"
    let level8: LocalizedStringKey = "level8"
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                HStack {
                    Image(systemName: model.isLevel1 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel1 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel1 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level1)
                        .font(model.isLevel1 ? .title2 : .title3)
                        .fontWeight(model.isLevel1 ? .bold : .none)
                        .foregroundColor(model.isLevel1 ? .white : Color("Font"))
                }.frame(width: model.isLevel1 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel1 ? 18 : 12)
                    .padding(.vertical, model.isLevel1 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel1 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.top, 8)
                    .padding(.horizontal)
                    .opacity(showViews[0] ? 1 : 0)
                    .offset(y: showViews[0] ? 0 : 200)
                
                HStack {
                    Image(systemName: model.isLevel2 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel2 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel2 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level2)
                        .font(model.isLevel2 ? .title2 : .title3)
                        .fontWeight(model.isLevel2 ? .bold : .none)
                        .foregroundColor(model.isLevel2 ? .white : Color("Font"))
                }.frame(width: model.isLevel2 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel2 ? 18 : 12)
                    .padding(.vertical, model.isLevel2 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel2 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.horizontal)
                    .opacity(showViews[1] ? 1 : 0)
                    .offset(y: showViews[1] ? 0 : 200)
                
                HStack {
                    Image(systemName: model.isLevel3 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel3 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel3 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level3)
                        .font(model.isLevel3 ? .title2 : .title3)
                        .fontWeight(model.isLevel3 ? .bold : .none)
                        .foregroundColor(model.isLevel3 ? .white : Color("Font"))
                }.frame(width: model.isLevel3 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel3 ? 18 : 12)
                    .padding(.vertical, model.isLevel3 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel3 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.horizontal)
                    .opacity(showViews[2] ? 1 : 0)
                    .offset(y: showViews[2] ? 0 : 200)
                
                HStack {
                    Image(systemName: model.isLevel4 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel4 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel4 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level4)
                        .font(model.isLevel4 ? .title2 : .title3)
                        .fontWeight(model.isLevel4 ? .bold : .none)
                        .foregroundColor(model.isLevel4 ? .white : Color("Font"))
                }.frame(width: model.isLevel4 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel4 ? 18 : 12)
                    .padding(.vertical, model.isLevel4 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel4 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.horizontal)
                    .opacity(showViews[3] ? 1 : 0)
                    .offset(y: showViews[3] ? 0 : 200)
                
                HStack {
                    Image(systemName: model.isLevel5 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel5 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel5 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level5)
                        .font(model.isLevel5 ? .title2 : .title3)
                        .fontWeight(model.isLevel5 ? .bold : .none)
                        .foregroundColor(model.isLevel5 ? .white : Color("Font"))
                }.frame(width: model.isLevel5 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel5 ? 18 : 12)
                    .padding(.vertical, model.isLevel5 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel5 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.horizontal)
                    .opacity(showViews[4] ? 1 : 0)
                    .offset(y: showViews[4] ? 0 : 200)
                
                HStack {
                    Image(systemName: model.isLevel6 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel6 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel6 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level6)
                        .font(model.isLevel6 ? .title2 : .title3)
                        .fontWeight(model.isLevel6 ? .bold : .none)
                        .foregroundColor(model.isLevel6 ? .white : Color("Font"))
                }.frame(width: model.isLevel6 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel6 ? 18 : 12)
                    .padding(.vertical, model.isLevel6 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel6 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.horizontal)
                    .opacity(showViews[5] ? 1 : 0)
                    .offset(y: showViews[5] ? 0 : 200)
                
                HStack {
                    Image(systemName: model.isLevel7 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel7 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel7 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level7)
                        .font(model.isLevel7 ? .title2 : .title3)
                        .fontWeight(model.isLevel7 ? .bold : .none)
                        .foregroundColor(model.isLevel7 ? .white : Color("Font"))
                }.frame(width: model.isLevel7 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel7 ? 18 : 12)
                    .padding(.vertical, model.isLevel7 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel7 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.horizontal)
                    .opacity(showViews[6] ? 1 : 0)
                    .offset(y: showViews[6] ? 0 : 200)
                
                HStack {
                    Image(systemName: model.isLevel8 ? "ellipsis" : "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(model.isLevel8 ? Color("AccentColor") : .white)
                        .frame(width: 10, height: 10)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 30, style: .circular)
                                .fill(model.isLevel8 ? .white : Color("AccentColor"))
                        }
                        
                    Text(level8)
                        .font(model.isLevel8 ? .title2 : .title3)
                        .fontWeight(model.isLevel8 ? .bold : .none)
                        .foregroundColor(model.isLevel8 ? .white : Color("Font"))
                }.frame(width: model.isLevel8 ? 300 : 260, alignment: .leading)
                    .padding(.horizontal, model.isLevel8 ? 18 : 12)
                    .padding(.vertical, model.isLevel8 ? 12 : 8)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("AccentColor"), lineWidth: 2)
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(model.isLevel8 ? Color("AccentColor") : .clear)
                        }
                    }
                    .padding(.horizontal)
                    .opacity(showViews[7] ? 1 : 0)
                    .offset(y: showViews[7] ? 0 : 200)
            }.padding(.top, 62)
                .onAppear(perform: animateViews)
            
            HStack {
                Spacer()
                
                Button(action: {
                    model.showingMissionsView = false
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
            
            Text(myMissionsHeading)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Font"))
                .padding(.top, 15)
                .frame(maxHeight: .infinity, alignment: .top)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
        }.preferredColorScheme(model.isDarkMode ? .dark : .light)
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
            .environmentObject(ContentModel())
    }
}

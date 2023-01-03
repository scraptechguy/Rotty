//
//  OverviewView.swift
//  Rotty
//
//  Created by Rostislav Brož on 12/3/22.
//

import SwiftUI

struct OverviewView: View {
    
    @EnvironmentObject var model: ContentModel
    @Environment(\.colorScheme) var current
    
    @State var showViews: [Bool] = Array(repeating: false, count: 8)
    @State var isInEnglish = true
    @State var index = 0
    
    let myMissionsHeading: LocalizedStringKey = "myMissionsHeading"
    let level1: LocalizedStringKey = "level1"
    let level2: LocalizedStringKey = "level2"
    let level3: LocalizedStringKey = "level3"
    let level4: LocalizedStringKey = "level4"
    let level5: LocalizedStringKey = "level5"
    let level6: LocalizedStringKey = "level6"
    let level7: LocalizedStringKey = "level7"
    let level8: LocalizedStringKey = "level8"
    
    let notificationsHeading: LocalizedStringKey = "notificationsHeading"
    let notificationsToday: LocalizedStringKey = "notificationsToday"
    let notificationsBefore: LocalizedStringKey = "notificationsBefore"
    
    let wasteSaved: LocalizedStringKey = "wasteSaved"
    
    let levelHeading: LocalizedStringKey = "levelHeading"
    let levelText: LocalizedStringKey = "levelText"
    
    let recipesHeading: LocalizedStringKey = "recipesHeading"
    
    let listHeading: LocalizedStringKey = "listHeading"
    
    let buttonsCamera: LocalizedStringKey = "buttonsCamera"
    let buttonsThemeDark: LocalizedStringKey = "buttonsThemeDark"
    let buttonsThemeLight: LocalizedStringKey = "buttonsThemeLight"
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    VStack {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                model.showingHelpView = true
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
                            }).sheet(isPresented: $model.showingHelpView) {
                                HelpView()
                                    .presentationDetents([.large])
                            }
                        }
                        
                        Spacer()
                    }
                    
                    // MARK: - User profile
                    
                    VStack {
                        Image("Ancaaaa")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .padding(5)
                            .overlay(Circle().stroke(Color("AccentColor"), style: StrokeStyle(lineWidth: 2, dash: [5, 7])))
                        
                        Text("Anička")
                            .font(.title3)
                            .foregroundColor(Color("Font"))
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                
                            }, label: {
                                Text(level6)
                                    .font(.headline)
                            })
                            
                            Text(" Lvl. \(model.currentLevel)")
                                .foregroundColor(Color("Font"))
                        }
                    }.opacity(showViews[0] ? 1 : 0)
                        .offset(y: showViews[0] ? 0 : 200)
                }
            }.onAppear(perform: animateViews)
                .onAppear(perform: model.checkLevel)
                .preferredColorScheme(model.isDarkMode ? .dark : .light)
        }
    }
    
    // MARK: - animateViews()
    
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
        
        withAnimation(.easeInOut.delay(0.3)) {
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

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
            .environmentObject(ContentModel())
    }
}

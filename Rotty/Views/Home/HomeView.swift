//
//  HomeView.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @Environment(\.colorScheme) var current
    
    @State var showViews: [Bool] = Array(repeating: false, count: 8)
    @State var isInEnglish = true
    
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
    
    let buttonsCamera: LocalizedStringKey = "buttonsCamera"
    let buttonsThemeDark: LocalizedStringKey = "buttonsThemeDark"
    let buttonsThemeLight: LocalizedStringKey = "buttonsThemeLight"
    
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
                    
                    // MARK: - Notifications
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(.clear)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                            
                            VStack(spacing: 10) {
                                HStack {
                                    Image(systemName: "bell")
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Text(notificationsHeading)
                                        .foregroundColor(Color("Font"))
                                }
                                    
                                Divider()
                                
                                Text(notificationsToday)
                                    .font(.headline)
                                    .foregroundColor(Color("Font"))
                                
                                Text("Lorem ipsum dolor sit amet, consectetur")
                                    .font(.footnote)
                                    .foregroundColor(Color("Font"))
                                    .multilineTextAlignment(.center)
                                
                                Text(notificationsBefore)
                                    .font(.headline)
                                    .foregroundColor(Color("Font"))
                                
                                Text("Lorem ipsum dolor sit amet, consectetur")
                                    .font(.footnote)
                                    .foregroundColor(Color("Font"))
                                    .multilineTextAlignment(.center)
                            }.padding(.horizontal)
                        }.frame(maxWidth: .infinity)
                            .opacity(showViews[1] ? 1 : 0)
                                .offset(y: showViews[1] ? 0 : 230)
                        
                        // MARK: - Waste saved
                        
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
                                    
                                    Text(wasteSaved)
                                        .multilineTextAlignment(.center)
                                }.foregroundColor(.white)
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                .opacity(showViews[2] ? 1 : 0)
                                    .offset(y: showViews[2] ? 0 : 230)
                            
                            // MARK: - Buttons
                            
                            HStack {
                                Link(destination: URL(string: "https://github.com/scraptechguy/Rotty")!) {
                                    VStack {
                                        Image(systemName: "cloud")
                                            .padding()
                                            .scaleEffect(1.5)
                                            .frame(width: 80, height: 80)
                                            .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color("AccentColor"), lineWidth: 2))
                                        
                                        Text("Github")
                                            .font(.footnote)
                                    }
                                }
                                
                                Button(action: {
                                    
                                }, label: {
                                    VStack {
                                        Image(systemName: "camera")
                                            .foregroundColor(.white)
                                            .padding()
                                            .scaleEffect(1.3)
                                            .frame(width: 80, height: 80)
                                            .background {
                                                RoundedRectangle(cornerRadius: 28)
                                                    .fill(Color("AccentColor"))
                                            }
                                        
                                        Text(buttonsCamera)
                                            .font(.footnote)
                                    }
                                })
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                .opacity(showViews[3] ? 1 : 0)
                                    .offset(y: showViews[3] ? 0 : 230)
                        }.frame(maxWidth: .infinity)
                    }.frame(height: 220)
                        .padding(.top, 25)
                        .padding(.horizontal)
                    
                    // MARK: - Map
                    
                    Map()
                        .frame(height: 160)
                        .mask(
                            RoundedRectangle(cornerRadius: 30)
                        )
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                        .padding(.horizontal)
                        .opacity(showViews[4] ? 1 : 0)
                        .offset(y: showViews[4] ? 0 : 250)
                    
                    // MARK: - Current level
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("AccentColor"))
                            .frame(height: 160)
                            .mask(
                                RoundedRectangle(cornerRadius: 30)
                            )
                        
                        VStack {
                            Text(levelHeading)
                                .font(.headline)
                            
                            HStack {
                                VStack {
                                    Gauge(value: 23, in: 0...100) {
                                        Text(String(model.points))
                                    }.gaugeStyle(.accessoryCircularCapacity)
                                        .frame(width: 50, height: 50)
                                        .tint(.white)
                                    
                                    Text("\(model.goal - model.points) points\nto the next level")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                }
                                
                                VStack {
                                    Text(levelText)
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                    
                                    Button(action: {
                                        model.showingMissionsView = true
                                    }, label: {
                                        Text(myMissionsHeading)
                                            .foregroundColor(.black)
                                            .padding(9)
                                            .padding(.horizontal, 5)
                                            .background {
                                                RoundedRectangle(cornerRadius: 30)
                                            }
                                    }).sheet(isPresented: $model.showingMissionsView) {
                                        MissionsView()
                                            .presentationDetents([.medium])
                                            .presentationDragIndicator(.visible)
                                    }
                                    
                                }.frame(width: 200)
                            }
                        }.foregroundColor(.white)
                    }.padding(.horizontal)
                        .opacity(showViews[5] ? 1 : 0)
                            .offset(y: showViews[5] ? 0 : 280)
                    
                    // MARK: - Waste saved
                    
                    HStack {
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
                                    
                                    Text(wasteSaved)
                                        .multilineTextAlignment(.center)
                                }.foregroundColor(.white)
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                .opacity(showViews[6] ? 1 : 0)
                                    .offset(y: showViews[6] ? 0 : 280)
                            
                            // MARK: - Buttons
                            
                            HStack {
                                Button(action: {
                                    withAnimation {
                                        isInEnglish.toggle()
                                    }
                                }, label: {
                                    VStack {
                                        Image(systemName: isInEnglish ? "globe.americas" : "house")
                                            .foregroundColor(.white)
                                            .padding()
                                            .scaleEffect(1.5)
                                            .frame(width: 80, height: 80)
                                            .background {
                                                RoundedRectangle(cornerRadius: 28)
                                                    .fill(Color("AccentColor"))
                                            }
                                        
                                        Text(isInEnglish ? "English" : "Čeština")
                                            .font(.footnote)
                                    }
                                })
                                
                                Button(action: {
                                    withAnimation {
                                        model.isDarkMode.toggle()
                                    }
                                }, label: {
                                    VStack {
                                        Image(systemName: model.isDarkMode ? "moon.fill" : "sun.max.fill")
                                            .padding()
                                            .scaleEffect(1.5)
                                            .frame(width: 80, height: 80)
                                            .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color("AccentColor"), lineWidth: 2))
                                        
                                        Text(model.isDarkMode ? buttonsThemeDark : buttonsThemeLight)
                                            .font(.footnote)
                                    }
                                })
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        }.frame(maxWidth: .infinity)
                        
                        // MARK: - Notifications
                        
                        ZStack {
                            Rectangle()
                                .fill(.clear)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("AccentColor"), lineWidth: 2))
                            
                            VStack(spacing: 10) {
                                HStack {
                                    Image(systemName: "bell")
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Text("Notifications")
                                        .foregroundColor(Color("Font"))
                                }
                                
                                Divider()
                                
                                Text("Today")
                                    .font(.headline)
                                    .foregroundColor(Color("Font"))
                                
                                Text("Lorem ipsum dolor sit amet, consectetur")
                                    .font(.footnote)
                                    .foregroundColor(Color("Font"))
                                    .multilineTextAlignment(.center)
                                
                                Text("25. 5.")
                                    .font(.headline)
                                    .foregroundColor(Color("Font"))
                                
                                Text("Lorem ipsum dolor sit amet, consectetur")
                                    .font(.footnote)
                                    .foregroundColor(Color("Font"))
                                    .multilineTextAlignment(.center)
                            }.padding(.horizontal)
                        }.frame(maxWidth: .infinity)
                            .opacity(showViews[7] ? 1 : 0)
                                .offset(y: showViews[7] ? 0 : 280)
                    }.frame(height: 220)
                        .padding(.horizontal)
                    
                    HStack(spacing: 0) {
                         Text("Version ")
                            .foregroundColor(.secondary)
                        
                        Text("1.0.0")
                            .foregroundColor(Color("AccentColor"))
                    }.padding(.top, 30)
                    
                    // MARK: - Debug
                    
                    Text("DEBUG")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            withAnimation {
                                model.onboardingShown = false
                            }
                        }, label: {
                            Text("Go back ")
                        })
                       
                        Text("to onboarding")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Spacer()
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                withAnimation {
                                    model.points += 25
                                    model.checkLevel()
                                }
                            }, label: {
                                Text("Add ")
                            })
                            
                            Text("25 points")
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                       
                        HStack(spacing: 0) {
                            Button(action: {
                                withAnimation {
                                    if model.points > 0 {
                                        
                                        model.points -= 25
                                        model.checkLevel()
                                        
                                    }
                                }
                            }, label: {
                                Text("Remove ")
                            })
                            
                            Text("25 points")
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                }
            }.refreshable {
                withAnimation {
                    showViews[0] = false
                    showViews[1] = false
                    showViews[2] = false
                    showViews[3] = false
                    showViews[4] = false
                    showViews[5] = false
                    showViews[6] = false
                    showViews[7] = false
                }
                
                model.checkLevel()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    animateViews()
                }
            }
        }.onAppear(perform: animateViews)
            .onAppear(perform: model.checkLevel)
            .preferredColorScheme(model.isDarkMode ? .dark : .light)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}

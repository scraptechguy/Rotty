//
//  HomeView.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var showingHelpView = false
    @State var showingMissionsView = false
    @State var showViews: [Bool] = Array(repeating: false, count: 8)
    @State var isDarkMode = false
    @State var isInEnglish = true
    
    let myMissionsHeading: LocalizedStringKey = "myMissionsHeading"
    let level6: LocalizedStringKey = "level6"
    
    let notificationsHeading: LocalizedStringKey = "notificationsHeading"
    let notificationsToday: LocalizedStringKey = "notificationsToday"
    let notificationsBefore: LocalizedStringKey = "notificationsBefore"
    
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
                                showingHelpView = true
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
                            }).sheet(isPresented: $showingHelpView) {
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
                        
                        Text("Anicka")
                            .font(.title3)
                            .foregroundColor(Color("Font"))
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                
                            }, label: {
                                Text(level6)
                                    .font(.headline)
                            })
                            
                            Text(" Lvl. 6")
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
                                    
                                    Text("of waste\nsaved")
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
                                        
                                        Text("Camera")
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
                                        showingMissionsView = true
                                    }, label: {
                                        Text(myMissionsHeading)
                                            .foregroundColor(.black)
                                            .padding(9)
                                            .padding(.horizontal, 5)
                                            .background {
                                                RoundedRectangle(cornerRadius: 30)
                                            }
                                    }).sheet(isPresented: $showingMissionsView) {
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
                                    
                                    Text("of waste\nsaved")
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
                                        isDarkMode.toggle()
                                    }
                                }, label: {
                                    VStack {
                                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                                            .padding()
                                            .scaleEffect(1.5)
                                            .frame(width: 80, height: 80)
                                            .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color("AccentColor"), lineWidth: 2))
                                        
                                        Text(isDarkMode ? "Dark" : "Light")
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    animateViews()
                }
            }
        }.onAppear(perform: animateViews)
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

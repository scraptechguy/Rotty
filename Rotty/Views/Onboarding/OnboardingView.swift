//
//  OnboardingView.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var showLogIn: Bool = false
    @State var showSignUp: Bool = false
    @State var currentIndex: Int = 0
    
    @State var status = ""
    
    @State var logInEmail = ""
    @State var logInPassword = ""
    
    @State var signUpEmail = ""
    @State var emailIsValid: Bool = true
    @State var signUpPassword = ""
    @State var signUpReenteredPassword = ""
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    let introHeading: LocalizedStringKey = "introHeading"
    let introText: LocalizedStringKey = "introText"
    let introButton: LocalizedStringKey = "introButton"
    
    let skipButton: LocalizedStringKey = "skipButton"
    
    let onboardingHeading1: LocalizedStringKey = "onboardingHeading1"
    let onboardingText1: LocalizedStringKey = "onboardingText1"
    
    let onboardingHeading2: LocalizedStringKey = "onboardingHeading2"
    let onboardingText2: LocalizedStringKey = "onboardingText2"
    
    let welcomeHeading: LocalizedStringKey = "welcomeHeading"
    let welcomeText: LocalizedStringKey = "welcomeText"
    let signUpButton: LocalizedStringKey = "signUpButton"
    let account: LocalizedStringKey = "account"
    let logInButton: LocalizedStringKey = "logInButton"
    
    let signUpHeading: LocalizedStringKey = "signUpHeading"
    let signUpPasswordHeading: LocalizedStringKey = "signUpPassword"
    let signUpReenterPasswordHeading: LocalizedStringKey = "signUpReenterPassword"
    
    let logInHeading: LocalizedStringKey = "logInHeading"
    let logInPasswordHeading: LocalizedStringKey = "logInPassword"
    let logInForgot: LocalizedStringKey = "logInForgot"
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $currentIndex) {
                    VStack {
                        Text("Track your shopping")
                            .font(.title)
                            .fontWeight(.bold)
                    }.tag(0)
                    
                    VStack {
                        Text("Learn about your trends")
                            .font(.title)
                            .fontWeight(.bold)
                    }.tag(1)
                    
                    VStack {
                        Text("And never let anything rot!")
                            .font(.title)
                            .fontWeight(.bold)
                    }.tag(2)
                }.tabViewStyle(.page(indexDisplayMode: .always))
                
                VStack {
                    Button(action: {
                        withAnimation {
                            if currentIndex < 2 {
                                
                                currentIndex += 1
                                
                            } else {
                                
                                model.onboardingShown = true
                                
                            }
                        }
                    }, label: {
                        Text("Next")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: screenSize.width / 1.5, height: 50)
                            .background {
                                Rectangle()
                                    .fill()
                                    .mask(RoundedRectangle(cornerRadius: 12))
                            }
                            .padding(.vertical)
                    })
                }.frame(maxWidth: .infinity)
                    .overlay(alignment: .bottom) {
                        let screenIsLast = currentIndex == intros.count
                        
                        HStack(spacing: 0) {
                            Text("By proceeding you agree to our ")
                                .font(.system(size: 14))
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                            
                            Link(destination: URL(string: "https://github.com/scraptechguy/Peep/blob/main/docs/PRIVACY.md")!) {
                                Text("Privacy Policy")
                                    .font(.system(size: 14))
                                    .fontWeight(model.fontIsBold ? .bold : .regular)
                                    .foregroundColor(Color("Font"))
                            }
                        }.offset(y: screenIsLast ? 8 : 50)
                            .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: screenIsLast)
                            .frame(maxWidth: .infinity)
                    }
            }
            
            NavigationBar()
        }.preferredColorScheme(model.isDarkMode ? .dark : .light)
    }
    
    @ViewBuilder
    func NavigationBar() -> some View {
        let screenIsFirst = currentIndex == 0
        let screenIsLast = currentIndex == 2
        
        HStack {
            Button(action: {
                withAnimation {
                    if currentIndex > 0 {
                        
                        currentIndex -= 1
                        
                    }
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Font"))
                    .padding([.trailing, .bottom])
            }).opacity(screenIsFirst ? 0 : 1)
                .animation(.easeInOut, value: screenIsFirst)
            
            Spacer()
            
            Button(action: {
                currentIndex = 2
            }, label: {
                Text(skipButton)
                    .foregroundColor(Color("Font"))
                    .fontWeight(model.fontIsBold ? .bold : .regular)
            }).opacity(screenIsLast ? 0 : 1)
                .animation(.easeInOut, value: screenIsLast)
        }.frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 15)
            .padding(.top, 10)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(ContentModel())
    }
}

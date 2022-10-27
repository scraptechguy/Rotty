//
//  OnboardingView.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var showOnboardingScreens: Bool = false
    @State var currentIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            IntroScreen()
            
            OnboardingScreens()
            
            NavigationBar()
        }.animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showOnboardingScreens)
    }
    
    @ViewBuilder
    func OnboardingScreens() -> some View {
        let screenIsLast = currentIndex == intros.count
        
        GeometryReader {
            let size = $0.size
                
            ZStack {
                ForEach(intros.indices, id: \.self) { index in
                    OnboardingScreen(size: size, index: index)
                }
                
                WelcomeScreen(size: size, index: intros.count)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .bottom) {
                    ZStack {
                        Image(systemName: "chevron.right")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .scaleEffect(!screenIsLast ? 1 : 0.001)
                            .opacity(!screenIsLast ? 1 : 0)
                        
                        HStack {
                            Text("Sign up")
                                .font(.title3)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image(systemName: "arrow.right")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }.padding(.horizontal, 15)
                            .scaleEffect(screenIsLast ? 1 : 0.001)
                            .frame(height: screenIsLast ? nil : 0)
                            .opacity(screenIsLast ? 1 : 0)
                    }.frame(width: screenIsLast ? size.width / 1.5 : 55, height: screenIsLast ? 50 : 55)
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: screenIsLast ? 10 : 30, style: screenIsLast ? .continuous : .circular)
                                .fill(Color("AccentColor"))
                        }
                        .onTapGesture {
                            if currentIndex == intros.count {
                                
                                model.onboardingShown = true
                                
                            } else {
                                
                                currentIndex += 1
                                
                            }
                        }
                        .offset(y: screenIsLast ? -40 : -90)
                        .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: screenIsLast)
                }
                .overlay(alignment: .bottom) {
                    let screenIsLast = currentIndex == intros.count
                    
                    HStack(spacing: 5) {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            model.onboardingShown = true
                        }, label: {
                            Text("Log in")
                                .font(.system(size: 14))
                                .foregroundColor(Color("AccentColor"))
                        })
                    }.offset(y: screenIsLast ? -12 : 100)
                        .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: screenIsLast)
                }
                .offset(y: showOnboardingScreens ? 0 : size.height)
        }
    }
    
    @ViewBuilder
    func OnboardingScreen(size: CGSize, index: Int) -> some View {
        let intro = intros[index]
        
        VStack(spacing: 10) {
            Text(intro.title)
                .bold()
                .font(.system(size: 28))
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
        }
    }
    
    @ViewBuilder
    func WelcomeScreen(size: CGSize, index: Int) -> some View {
        VStack(spacing: 10) {
            Image("rotty_happy")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("And recycle!")
                .bold()
                .font(.system(size: 28))
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
        }.offset(y: -30)
    }
    
    @ViewBuilder
    func NavigationBar() -> some View {
        let screenIsLast = currentIndex == intros.count
        
        HStack {
            Button(action: {
                if currentIndex > 0 {
                    
                    currentIndex -= 1
                    
                } else {
                    
                    showOnboardingScreens.toggle()
                    
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Font"))
            })
            
            Spacer()
            
            Button(action: {
                currentIndex = intros.count
            }, label: {
                Text("Skip")
                    .foregroundColor(Color("Font"))
            }).opacity(screenIsLast ? 0 : 1)
                .animation(.easeInOut, value: screenIsLast)
        }.padding(.horizontal, 15)
            .padding(.top, 10)
            .frame(maxHeight: .infinity, alignment: .top)
            .offset(y: showOnboardingScreens ? 0 : -120)
    }
    
    @ViewBuilder
    func IntroScreen() -> some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 10) {
                Image("rotty_happy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height / 2)
                
                Text("Rotty says hi!")
                    .bold()
                    .font(.largeTitle)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Text("Let's dive in")
                    .bold()
                    .font(.system(size: 17))
                    .padding(.horizontal, 40)
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(Color("AccentColor"))
                    }
                    .onTapGesture {
                        showOnboardingScreens.toggle()
                    }
                    .padding(.top, 50)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .offset(y: showOnboardingScreens ? -size.height : 0)
        }.ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(ContentModel())
    }
}

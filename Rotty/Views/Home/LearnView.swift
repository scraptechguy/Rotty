//
//  LearnView.swift
//  Rotty
//
//  Created by Rostislav Brož on 1/3/23.
//

import SwiftUI

struct LearnView: View {
    
    @State var showViews: [Bool] = Array(repeating: false, count: 8)
    @State private var page = 0
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    TabView(selection: $page) {
                        HStack {
                            AsyncImage(url: URL(string: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcf.foodista.com%2Fcontent%2Ffp%2Frnekq4ei3ls7y6gt.jpg&f=1&nofb=1&ipt=608e5b4f7aae91d786051ad630193dae8fe985a26c6fdddc1da90f4cd72e71ab&ipo=images")) { phase in
                                                                
                                if let image = phase.image {
                                    
                                    image
                                    
                                } else if phase.error != nil {
                                    
                                    ProgressView()
                                    
                                } else {
                                    
                                    ProgressView()
                                    
                                }
                            }.scaledToFit()
                                .frame(width: 50, height: 50)
                                .mask(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                            
                            VStack(alignment: .leading) {
                                Text("Pancakes")
                                    .font(.title2.bold())
                                
                                Text("Pencakes are made with eggs")
                                    .lineLimit(1)
                            }.frame(width: 200)
                        }.tag(0)
                            .onAppear(perform: animatePage)
                        
                        HStack {
                            AsyncImage(url: URL(string: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fc.pxhere.com%2Fimages%2Fda%2Fca%2F749301471cd7588b899613e8abf3-1620764.jpg!d&f=1&nofb=1&ipt=e380191a576e58dc6d7f2e30420817a131d5ee71a966d9608aa3f754a6609f68&ipo=images")) { phase in
                                                                
                                if let image = phase.image {
                                    
                                    image
                                    
                                } else if phase.error != nil {
                                    
                                    ProgressView()
                                    
                                } else {
                                    
                                    ProgressView()
                                    
                                }
                            }.scaledToFit()
                                .frame(width: 50, height: 50)
                                .mask(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                            
                            VStack(alignment: .leading) {
                                Text("Apple pie")
                                    .font(.title2.bold())
                                
                                Text("Apple pie is made with eggs")
                                    .lineLimit(1)
                            }.frame(width: 200)
                        }.tag(1)
                            .onAppear(perform: animatePage)
                        
                        HStack {
                            AsyncImage(url: URL(string: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi1.wp.com%2Fwww.cookingfromheart.com%2Fwp-content%2Fuploads%2F2019%2F12%2FEggless-Steamed-Christmas-Pudding-3.jpg%3Ffit%3D683%252C1024&f=1&nofb=1&ipt=5a9b4bf146fdb08d66e27f3a49cea7a8051ce650a9d55335ca7d818ff4fa34e8&ipo=images")) { phase in
                                                                
                                if let image = phase.image {
                                    
                                    image
                                    
                                } else if phase.error != nil {
                                    
                                    ProgressView()
                                    
                                } else {
                                    
                                    ProgressView()
                                    
                                }
                            }.scaledToFit()
                                .frame(width: 50, height: 50)
                                .mask(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                            
                            VStack(alignment: .leading) {
                                Text("Pudding")
                                    .font(.title2.bold())
                                
                                Text("Pudding is made with eggs")
                                    .lineLimit(1)
                            }.frame(width: 200)
                        }.tag(2)
                            .onAppear(perform: animatePage)
                        
                        HStack {
                            AsyncImage(url: URL(string: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-Gr2uikvxsBQ%2FUQHZF5-OmHI%2FAAAAAAAAGKo%2F-X4fCo2WbTE%2Fs1600%2FIMG_2399.JPG&f=1&nofb=1&ipt=0b7544db7d774e4c5b947df2b74f973cc2b30e76554102ac72e7fe2b9eb9e9df&ipo=images")) { phase in
                                                                
                                if let image = phase.image {
                                    
                                    image
                                    
                                } else if phase.error != nil {
                                    
                                    ProgressView()
                                    
                                } else {
                                    
                                    ProgressView()
                                    
                                }
                            }.scaledToFit()
                                .frame(width: 50, height: 50)
                                .mask(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                            
                            VStack(alignment: .leading) {
                                Text("Salad")
                                    .font(.title2.bold())
                                
                                Text("Salad is made with eggs")
                                    .lineLimit(1)
                            }.frame(width: 200)
                        }.tag(3)
                            .onAppear(perform: animatePage)
                        
                        HStack {
                            AsyncImage(url: URL(string: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-J-Xcm_lbY54%2FVPTUw6OdKLI%2FAAAAAAAAbtc%2FCIG-9Ah_MAU%2Fs1600%2FDPP_betty-manousos-french-toast0050a.JPG&f=1&nofb=1&ipt=b8f393c32802d469657f140f69827980ae2e4b8670e41289ceed2837a6584da9&ipo=images")) { phase in
                                                                
                                if let image = phase.image {
                                    
                                    image
                                    
                                } else if phase.error != nil {
                                    
                                    ProgressView()
                                    
                                } else {
                                    
                                    ProgressView()
                                    
                                }
                            }.scaledToFit()
                                .frame(width: 50, height: 50)
                                .mask(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                            
                            VStack(alignment: .leading) {
                                Text("Toast")
                                    .font(.title2.bold())
                                
                                Text("Toast is made with eggs")
                                    .lineLimit(1)
                            }.frame(width: 200)
                        }.tag(4)
                            .onAppear(perform: animatePage)
                    }.tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .opacity(showViews[0] ? 1 : 0)
                        .offset(y: showViews[0] ? 0 : 200)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("Chicken")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .background {
                                        Rectangle()
                                            .fill(Color("AccentColor"))
                                            .mask(RoundedRectangle(cornerRadius: 15))
                                    }
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Potatos")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .background {
                                        Rectangle()
                                            .fill(Color("AccentColor"))
                                            .mask(RoundedRectangle(cornerRadius: 15))
                                    }
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Letuce")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .background {
                                        Rectangle()
                                            .fill(Color("AccentColor"))
                                            .mask(RoundedRectangle(cornerRadius: 15))
                                    }
                            })
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Yoghurt")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    .background {
                                        Rectangle()
                                            .fill(Color("AccentColor"))
                                            .mask(RoundedRectangle(cornerRadius: 15))
                                    }
                            })
                        }.padding(.leading)
                    }.opacity(showViews[1] ? 1 : 0)
                        .offset(y: showViews[1] ? 0 : 200)
                    
                    Text("Learn")
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                        .opacity(showViews[2] ? 1 : 0)
                        .offset(y: showViews[2] ? 0 : 200)
                    
                    HStack {
                        Image("rotty_coolaf")
                            .resizable()
                            .frame(width: 100, height: 120)
                        
                        Text("Aperiam explicabo qui omnis. Ut odio consequatur omnis id incidunt. Suscipit minus soluta nostrum.")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                    }.padding()
                        .opacity(showViews[3] ? 1 : 0)
                        .offset(y: showViews[3] ? 0 : 200)
                    
                    HStack {
                        Text("Aperiam explicabo qui omnis. Ut odio consequatur omnis id incidunt. Suscipit minus soluta nostrum.")
                            .multilineTextAlignment(.center)
                            .padding(.leading, 50)
                        
                        Image("rotty_happy")
                            .resizable()
                            .frame(width: 100, height: 120)
                            .padding(.trailing, 30)
                    }.padding()
                        .opacity(showViews[4] ? 1 : 0)
                        .offset(y: showViews[4] ? 0 : 200)
                    
                    Map()
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .mask(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)
                        .opacity(showViews[5] ? 1 : 0)
                        .offset(y: showViews[5] ? 0 : 200)
                    
                    VStack(spacing: 0) {
                        Text("Aperiam explicabo qui omnis. Ut odio consequatur omnis id incidunt. Suscipit minus soluta nostrum.")
                            .multilineTextAlignment(.center)
                        
                        Image("rotty_mad")
                            .resizable()
                            .frame(width: 100, height: 120)
                    }.padding()
                        .opacity(showViews[6] ? 1 : 0)
                        .offset(y: showViews[6] ? 0 : 200)
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
            .onAppear(perform: animateViews)
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
    
    func animatePage() {
        
            if page < 4 {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                    withAnimation {
                        page += 1
                    }
                }
                
            } else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                    page = 0
                }
                
            }

    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
            .preferredColorScheme(.light)
    }
}

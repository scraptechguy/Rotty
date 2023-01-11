//
//  OverviewView.swift
//  Rotty
//
//  Created by Rostislav Brož on 12/3/22.
//

import SwiftUI
import Charts

struct OverviewView: View {
    
    @EnvironmentObject var model: ContentModel
    @Environment(\.colorScheme) var current
    
    @State var showViews: [Bool] = Array(repeating: false, count: 8)
    @State var isInEnglish = true
    @State var index = 0
    @State var currentTab: String = "7 days"
    @State var currentActiveItem: SiteView?
    @State var plotWidth: CGFloat = 0
    
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
                                    .fontWeight(model.fontIsBold ? .bold : .regular)
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
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                
                            }, label: {
                                Text("Missionary")
                                    .font(.headline)
                                    .fontWeight(model.fontIsBold ? .bold : .regular)
                            })
                            
                            Text(" Lvl. \(model.currentLevel)")
                                .foregroundColor(Color("Font"))
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                        }
                    }.opacity(showViews[0] ? 1 : 0)
                        .offset(y: showViews[0] ? 0 : 200)
                }
                
                // MARK: - Charts
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Food saved")
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Picker("", selection: $currentTab) {
                            Text("Overall")
                                .tag("Overall")
                            
                            Text("30 days")
                                .tag("30 days")
                            
                            Text("7 days")
                                .tag("7 days")
                        }.pickerStyle(.segmented)
                    }.padding(.bottom)
                    
                    Chart {
                        ForEach(sample_analytics) { item in
                            LineMark(
                                x: .value("Hour", item.hour, unit: .hour),
                                y: .value("Views", item.views)
                            ).interpolationMethod(.catmullRom)
                            
                            AreaMark(
                                x: .value("Hour", item.hour, unit: .hour),
                                y: .value("Views", item.views)
                            ).interpolationMethod(.catmullRom)
                                .foregroundStyle(Color("AccentColor").opacity(0.1).gradient)
                            
                            if let currentActiveItem, currentActiveItem.id == item.id {
                                
                                RuleMark(x: .value("Hour", currentActiveItem.hour))
                                    .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                                    .offset(x: (plotWidth / CGFloat(sample_analytics.count)) / 2)
                                    .annotation(position: .top) {
                                        VStack(alignment: .leading, spacing: 6) {
                                            Text("Food saved")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            
                                            Text(String(currentActiveItem.views))
                                                .font(.title3)
                                        }.padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background {
                                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                                    .fill(.white.shadow(.drop(radius: 2)))
                                            }
                                    }
                                
                            }
                        }
                    }.frame(height: 150)
                        .chartYScale(domain: 0...15000)
                        .chartOverlay(content: { proxy in
                            Rectangle()
                                .fill(.clear).contentShape(Rectangle())
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let location = value.location
                                            
                                            if let date: Date = proxy.value(atX: location.x) {
                                                
                                                let calendar = Calendar.current
                                                let hour = calendar.component(.hour, from: date)
                                                
                                                if let currentItem = sample_analytics.first(where:  { item in
                                                    calendar.component(.hour, from: item.hour) == hour }) {
                                                    
                                                    currentActiveItem = currentItem
                                                    plotWidth = proxy.plotAreaSize.width
                                                    
                                                }
                                            }
                                        }
                                        .onEnded { value in
                                            currentActiveItem = nil
                                        }
                                )
                        })
                }.padding([.horizontal], 40)
                    .padding(.top)
                    .opacity(showViews[1] ? 1 : 0)
                    .offset(y: showViews[1] ? 0 : 200)
                
            }.onAppear(perform: animateViews)
                .onAppear(perform: model.checkLevel)
                .onDisappear(perform: resetViews)
                .onAppear {
                    for (index, _) in sample_analytics.enumerated() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                            withAnimation(.easeInOut(duration: 0.8)) {
                                sample_analytics[index].animate = true
                            }
                        }
                    }
                }
        }.preferredColorScheme(model.isDarkMode ? .dark : .light)
            .refreshable {
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
    
    // MARK: - resetViews()
    
    func resetViews() {
        
        showViews[0] = false
        showViews[1] = false
        showViews[2] = false
        showViews[3] = false
        showViews[4] = false
        showViews[5] = false
        showViews[6] = false
        showViews[7] = false
        
    }
}

// MARK: - Sample data

struct SiteView: Identifiable {
    
    var id = UUID().uuidString
    var hour: Date
    var views: Double
    var animate: Bool = false
    
}

extension Date {
    
    func updateHour(value: Int) -> Date {
        
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
        
    }
    
}

var sample_analytics: [SiteView] = [

    SiteView(hour: Date().updateHour(value: 8), views: 1500),
    SiteView(hour: Date().updateHour(value: 9), views: 2600),
    SiteView(hour: Date().updateHour(value: 10), views: 3500),
    SiteView(hour: Date().updateHour(value: 11), views: 6500),
    SiteView(hour: Date().updateHour(value: 12), views: 3500),
    SiteView(hour: Date().updateHour(value: 13), views: 2450),
    SiteView(hour: Date().updateHour(value: 14), views: 7500)
    
]

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
            .environmentObject(ContentModel())
    }
}
